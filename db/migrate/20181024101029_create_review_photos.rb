class CreateReviewPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :review_photos do |t|
      t.integer :review_id
      t.string :review_image_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
