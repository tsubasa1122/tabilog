class CreateEvaluationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_images do |t|
      t.string :image_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
