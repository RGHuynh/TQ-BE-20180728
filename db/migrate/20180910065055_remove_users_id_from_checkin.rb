class RemoveUsersIdFromCheckin < ActiveRecord::Migration[5.2]
  def change
    remove_column :checkins, :users_id
  end
end
