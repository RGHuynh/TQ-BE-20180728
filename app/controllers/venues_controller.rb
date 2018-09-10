class VenuesController < ApplicationController
  def get_venue
    venues = FourSquareService.new(params)
    @venues_list = venues.get_list_of_venue
    render json: @venues_list 
  end

  def checkin
    
  end
end
