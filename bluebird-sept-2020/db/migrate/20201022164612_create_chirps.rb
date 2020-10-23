class CreateChirps < ActiveRecord::Migration[5.2]
  def change
    create_table :chirps do |t|
      t.text :body, null: false #string < 255 chars, text is more
      t.integer :author_id, null: false #foreign key
    end

    add_index :chirps, :author_id
  end
end
