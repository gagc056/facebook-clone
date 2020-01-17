# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post_like, foreign_key: 'post_id', class_name: 'Post'
  belongs_to :user_like, foreign_key: 'user_id', class_name: 'User'
end
