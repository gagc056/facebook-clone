# frozen_string_literal: true

module PostsHelper

  def  find_user_post(post)
    post.likes.find_by(user_id: current_user.id)
  end
end