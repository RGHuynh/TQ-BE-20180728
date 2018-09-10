class Checkin < ApplicationRecord
  validates :name, :latitude, :longitude, :checkin, presence: true
  belongs_to :user, optional: true
end
