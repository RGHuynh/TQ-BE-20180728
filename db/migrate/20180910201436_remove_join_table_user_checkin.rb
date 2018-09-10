class RemoveJoinTableUserCheckin < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :users, :checkins
  end
end
