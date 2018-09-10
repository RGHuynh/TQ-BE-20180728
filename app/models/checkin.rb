class Checkin < ApplicationRecord
  validates :name, :latitude, :longitude, presence: true
end
