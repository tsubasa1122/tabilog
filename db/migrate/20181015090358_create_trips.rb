class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :place
      t.string :telephone_number
      t.string :photo_id
      t.integer :category_id

      t.timestamps
    end
  end
end
