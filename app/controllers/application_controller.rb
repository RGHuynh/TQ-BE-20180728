class ApplicationController < ActionController::API
  before_action :authenticate, :connect_to_webhook

  def token
    return if request == nil
    return if request.env["HTTP_AUTHORIZATION"] == nil
    return request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last.strip
  end

  def authenticate
    jwt_decode = JWT.decode(token, ENV['SECRET_KEY'], true, { algorithm: 'HS256' })
    if (params[:id] || params[:user_id]) == jwt_decode[0]["user"].to_s
      return
    else
      return not_found
    end
  end

  def connect_to_webhook
    post_longitude(params)
    post_longitude(params)
  end

  private

    def get_user_id
      return params[:id] || params[:user_id]
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def min_checkin?
      if Checkin.where(id: params[:id]).count < 10
        return false
      end
      return true
    end

    def post_longitude(params)
      unplug_service = UnplugService.new(params)
      unplug_service.get_forecast_longitude
    end
end
