class AddUserFkToCheckins < ActiveRecord::Migration[5.2]
  def change
    add_reference :checkins, :user, foreign_key: true
  end
end
