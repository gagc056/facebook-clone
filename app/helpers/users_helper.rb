# frozen_string_literal: true

module UsersHelper
  def search_users_list(users)
    users.select do |user|
      next if user == current_user || current_user.friends.include?(user)

      user
    end
  end

  def search_users_list_not_empty
    !search_users_list(@users).empty?
  end
end
