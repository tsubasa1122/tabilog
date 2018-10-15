class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :evaluation_id
      t.integer :user_id
      t.integer :trip_id
      t.integer :evaluation_numeric_number
      t.string :comment
      t.string :month
      t.integer :time_zone

      t.timestamps
    end
  end
end
