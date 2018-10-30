class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :evaluation_id
      t.integer :user_id
      t.integer :trip_id
      t.string :comment
      t.string :month
      t.datetime :timezone_start
      t.datetime :timezone_end
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
