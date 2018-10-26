class CreateTripPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_photos do |t|
      t.integer :trip_id , null:false
      t.string :trip_image_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
