class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :chirp_id, null: false 
      t.timestamps
    end

    add_index :likes, [:chirp_id, :liker_id], unique: true #checking uniqueness for pair of foreign keys, adds index to chirp_id
    add_index :likes, :liker_id 
  end
end
