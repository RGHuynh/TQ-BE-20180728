class CreateJoinTableUsersCheckin < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :checkins do |t|
      t.index [:user_id, :checkin_id]
      t.index [:checkin_id, :user_id]
    end
  end
end
