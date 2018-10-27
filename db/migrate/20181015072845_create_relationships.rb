class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :follwer_id
      t.integer :following_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
