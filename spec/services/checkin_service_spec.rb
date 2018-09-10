require 'rails_helper'
require_relative '../../app/services/checkin_service/checkin_service.rb'

RSpec.describe 'CheckinService', type: :services do 
  describe "#user_distance?" do 

    it 'returns false if user is not 1km away' do 
      params = {
        user: {
          "latitude": "36.7782593,",
          "longitude": "-113.4179324"
      },
        'latitude': "36.77330414938416",
        'longitude': "-120.4184453264251"
      }
      checkin_service = CheckinService.new(params)
      expect(checkin_service.user_distance?).to be false
    end

    it 'returns false if user is missing params' do 
      params = {
        user: {
          "longitude": "-119.4179324"
      },
        'latitude': "36.77330414938416",
        'longitude': "-120.4184453264251"
      }
      checkin_service = CheckinService.new(params)
      expect(checkin_service.user_distance?).to be false
    end

    it 'returns true if user is 1km away' do 
      params = {
        user: {
          "latitude": "36.7782593,",
          "longitude": "-119.4179324"
      },
        'latitude': "36.77330414938416",
        'longitude': "-119.41792951887157"
      }
      checkin_service = CheckinService.new(params)
      expect(checkin_service.user_distance?).to be true
    end

  end
  describe "#checkin" do 
    it 'returns not checked in' do

    end
  end
end