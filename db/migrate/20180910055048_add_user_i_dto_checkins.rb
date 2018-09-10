class AddUserIDtoCheckins < ActiveRecord::Migration[5.2]
  def change
    add_reference :checkins, :user
  end
end
