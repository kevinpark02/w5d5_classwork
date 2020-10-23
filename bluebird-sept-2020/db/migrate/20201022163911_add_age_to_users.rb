class AddAgeToUsers < ActiveRecord::Migration[5.2]
  def change
    #method, table_name, column_name, datatype, optional constraints
    add_column :users, :age, :integer, null: false
  end
end
