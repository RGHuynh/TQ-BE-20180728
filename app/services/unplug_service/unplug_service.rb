require 'net/http'
require 'net/https'

class UnplugService

  def initialize(params)
    @user_id = params[:id]
  end

  def get_forecast_longitude
    post_unplugg(filter_params(retrieve_user(:longitude)))
  end

  def get_forecast_latitude
    post_unplugg(filter_params(retrieve_user(:latitude)))
  end

  private
    def post_unplugg(distance)
      uri = URI.parse("https://api.unplu.gg")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new("/forecast")
      request.add_field('Content-Type', 'application/json')
      request.add_field('x-access-token', ENV['UNPLUG_SECRET'])
      request.body = distance
      response = http.request(request)
    end

    def filter_params(distance)
      user_history = {}
      user_history["data"] = distance
      user_history["forecast_to"] = DateTime.now.to_time.to_i
      user_history["callback"] = (ENV["CALLBACK_WEBHOOK"] + "/" + @user_id)
      user_history.to_json
    end

    def retrieve_user(distance)
      user_history_location = []
      Checkin.where(id: @user_id).each do |checkin|
        checkin_data = {}
        checkin_data["timestamp"] = DateTime.now.to_time.to_i
        checkin_data["value"] = checkin[distance].to_f
        user_history_location << checkin_data
      end
      return user_history_location
    end

end