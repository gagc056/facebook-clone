# frozen_string_literal: true

module UsersHelper

  def search_users_list users
    users.select {|user| user unless user == current_user || current_user.friends.include?(user) }
  end

  def search_users_list_not_empty
    search_users_list(@users).size > 0
  end
end
