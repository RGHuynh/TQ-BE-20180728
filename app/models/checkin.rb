class Checkin < ApplicationRecord
  validates :name, :latitude, :longitude, :checkin, presence: true
end
