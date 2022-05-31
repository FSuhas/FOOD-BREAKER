class RenameColumnTypeInEvent < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :type, :experience
  end
end
