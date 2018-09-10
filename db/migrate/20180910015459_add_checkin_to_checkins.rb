class AddCheckinToCheckins < ActiveRecord::Migration[5.2]
  def change
    add_column :checkins, :checkin, :boolean
  end
end
