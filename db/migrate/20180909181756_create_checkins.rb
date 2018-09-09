class CreateCheckins < ActiveRecord::Migration[5.2]
  def change
    create_table :checkins do |t|
      t.string :name, null: false
      t.decimal :longitude, null: false
      t.decimal :latitude, null: false
      t.timestamps
    end
    add_reference :checkins, :users, index: true
  end
end
