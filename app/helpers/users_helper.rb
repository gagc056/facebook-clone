# frozen_string_literal: true

module UsersHelper
  def find_friendship_by_friend(friend)
    @friendship = Friendship.find_by(user_id: current_user.id, friend_id: friend.id)

    if @friendship.nil?
      return Friendship.find_by(user_id: friend.id, friend_id: current_user.id)
    else
      return @friendship
    end
  end
  
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
