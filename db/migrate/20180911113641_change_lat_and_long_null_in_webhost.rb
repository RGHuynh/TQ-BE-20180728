class ChangeLatAndLongNullInWebhost < ActiveRecord::Migration[5.2]
  def change
    change_column_null :webhooks, :longitude, true
    change_column_null :webhooks, :latitude, true
  end
end
