class ApplicationController < ActionController::API
  before_action :authenticate

  def token
    return if request == nil
    return if request.env["HTTP_AUTHORIZATION"] == nil
    return request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last.strip
  end

  def authenticate
    jwt_decode = JWT.decode(token, ENV['SECRET_KEY'], true, { algorithm: 'HS256' })
    if params[:id] == jwt_decode[0]["user"].to_s
      return
    else
      return not_found
    end
  end

  private
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
