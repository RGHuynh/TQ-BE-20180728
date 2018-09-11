class CheckinService
  def initialize(params)  
    @user_latitude = params[:user][:latitude].to_f
    @user_longitude = params[:user][:longitude].to_f
    @venue_latitude = params[:latitude].to_f
    @venue_longitude = params[:longitude].to_f

    @MILES_PER_LONGITUDE = 55.0
    @MILES_PER_LATITUDE = 69.0
    @MAX_MILES = 3.106856
  end

  def user_distance?
    distances_in_meters = Haversine.distance(@user_latitude, @user_longitude, @venue_latitude, @venue_longitude).to_meters
    max_meters = 1000
    if distances_in_meters <= max_meters
      return true
    else
      return false
    end
  end

  def identify_user
    user_list = []
    binding.pry
    list_of_users.each do |user|
      user_id = user[:user_id]
      user_list << User.find(user_id)[:name]
    end
    user_list
  end

  private

  def calculate_long_min
    (@user_longitude - (@MAX_MILES / @MILES_PER_LONGITUDE))
  end

  def calculate_long_max
    (@user_longitude + (@MAX_MILES / @MILES_PER_LONGITUDE))
  end

  def calculate_lat_max
    (@user_latitude + (@MAX_MILES / @MILES_PER_LATITUDE))
  end

  def calculate_lat_min
    (@user_latitude - (@MAX_MILES / @MILES_PER_LATITUDE))
  end

  def list_of_users
    long_min = calculate_long_min
    long_max = calculate_long_max
    lat_min = calculate_lat_min
    lat_max = calculate_lat_max
    Checkin.where(latitude: lat_min..lat_max).where(longitude: long_min..long_max).where(checkin: true)
  end

end