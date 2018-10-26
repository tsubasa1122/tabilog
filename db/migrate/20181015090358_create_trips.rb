class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :place_name
      t.string :place_detail
      t.string :telephone_number
      t.string :address
      t.integer :category_id
      t.float :latitude
      t.float :longitude
      t.datetime :deleted_at
      t.datetime :start_time
      t.datetime :end_time
      t.string :regular_holiday

      t.timestamps
    end
  end
end
