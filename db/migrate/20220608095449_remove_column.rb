class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :address
    add_reference :chatrooms, :event, index: true
    add_column :bookings, :comments, :text
  end
end
