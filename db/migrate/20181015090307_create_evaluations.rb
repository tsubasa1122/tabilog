class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.string :evaluation_name
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
