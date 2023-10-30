class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.integer :follower_id, nul: false
      t.integer :followed_id, nul: false

      t.timestamps
    end
  end
end
