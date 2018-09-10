class CheckinService
  def initialize(params)
    @latitude = params[:user][:latitude].to_f
    @longitude = params[:user][:longitude].to_f
    @venue_latitude = params[:latitude].to_f
    @venue_longitude = params[:longitude].to_f
  end

  def user_distance?
    distance_in_meters = Haversine.distance(@latitude, @longitude, @venue_latitude, @venue_longitude).to_meters
    if distance_in_meters <= 1000
      return true
    else
      return false
    end
  end
end