class CreateWannagos < ActiveRecord::Migration[5.2]
  def change
    create_table :wannagos do |t|
      t.integer :user_id
      t.integer :review_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
