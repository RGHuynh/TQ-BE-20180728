class VenuesController < ApplicationController
  skip_before_action :connect_to_webhook
  def get_venue
    venues = FourSquareService.new(params)
    @venues_list = venues.get_list_of_venue
    render json: @venues_list 
  end

end
