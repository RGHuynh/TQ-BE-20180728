class CreateWebhooks < ActiveRecord::Migration[5.2]
  def change
    create_table :webhooks do |t|
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
