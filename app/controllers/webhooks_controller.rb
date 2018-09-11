class WebhooksController < ApplicationController
  skip_before_action :authenticate
  def receive
    data = JSON.parse(request.body.read)
    if !data["error"]
      if Webhook.where(user_id: params[:id], latitude: nil) != []
        update_to_user_webhook_latitude
      else
        post_to_user_webhook_longitude
        return
      end
    end
    render json: data
  end

  private
    def post_to_user_webhook_longitude
      data = JSON.parse(request.body.read)
      Webhook.create({longitude: data["forecast"].first["value"], user_id: params[:id]})
    end

    def update_to_user_webhook_latitude
      data = JSON.parse(request.body.read)
      user_last_webhook = Webhook.where(user_id: params[:id]).last
      user_last_webhook[:latitude] = data["forecast"].first["value"]
      Webhook.update(user_last_webhook)
    end
end
