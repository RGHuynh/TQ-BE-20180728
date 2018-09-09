class ApplicationController < ActionController::API
  before_action :authenticate

  def token
    return if request == nil
    return request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last.strip

  end

  def authenticate
    jwt_decode = JWT.decode(token, ENV['SECRET_KEY'], true, { algorithm: 'HS256' })
  end
end
