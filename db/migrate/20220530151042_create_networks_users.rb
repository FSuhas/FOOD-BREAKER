class CreateNetworksUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :networks_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :network, null: false, foreign_key: true

      t.timestamps
    end
  end
end
