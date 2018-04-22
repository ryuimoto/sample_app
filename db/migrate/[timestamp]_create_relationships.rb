class CreateRelationships < ActiveRecord::Migration>
    def change
        create_table :relationships do |t|
            t.integer :folower_id
            t.integer :followed_id
            
            t.timestamps
        end
        add_index :relationships, :followe_id
        add_index :relationships, :followed_id
        add_index :relationships, [:follwer_id, :followed_id], unique: true
    end
end
