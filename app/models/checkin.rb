class Checkin < ApplicationRecord
  validates :venue_name, :latitude, :longitude, :checkin, presence: true
  belongs_to :user, optional: true
end
