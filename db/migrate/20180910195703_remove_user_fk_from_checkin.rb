class RemoveUserFkFromCheckin < ActiveRecord::Migration[5.2]
  def change
    remove_column :checkins, :user_id, :integer
  end
end
