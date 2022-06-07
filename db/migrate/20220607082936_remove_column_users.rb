class RemoveColumnUsers < ActiveRecord::Migration[7.0]
  def change
    remove_columns :users, :last_name
    rename_column :users, :first_name, :nickname
  end
end
