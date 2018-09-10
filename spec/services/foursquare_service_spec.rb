require 'rails_helper'
require_relative '../../app/services/foursquare_service/foursquare_service.rb'

RSpec.describe 'FourSquareService', type: :services do
  describe '#get_venue' do 
    it 'returns a status 200' do
      four_square_service = FourSquareService.new({})
      expect(four_square_service.get_venue_response.status).to eq(200)
    end
  end

  describe '#get_popular_venue' do
    it 'returns a status 200' do 
      four_square_service = FourSquareService.new({})
      expect(four_square_service.get_popular_response.status).to eq(200)
    end
  end

  describe '#list_of_venue' do
    it 'returns a list of venue name, log, lad within 5km' do 
      four_square_service = FourSquareService.new({})
      expect(four_square_service.get_list_of_venue).to be_a Array
    end
  end

end