class AddOmniauthColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uuid, :string
    add_column :users, :provider, :string
  end
end
