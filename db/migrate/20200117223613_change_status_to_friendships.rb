class ChangeStatusToFriendships < ActiveRecord::Migration[6.0]
  change_column :friendships, :status, :boolean, :default => false
end
