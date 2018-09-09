class SessionsController < ApplicationController
  skip_before_action :authenticate

  def create_code
    return if !authenticate_params
    
    user = User.find_by(email: params[:email])    
    if user[:password] == params[:password]
      jwt = JWT.encode({user: user[:id]}, ENV['SECRET_KEY'], 'HS256')
      render json: {jwt: jwt}
    end
  end

  def authenticate_params
    params.permit(:email, :password)
  end
end
