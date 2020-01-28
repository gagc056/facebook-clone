# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :commenters, through: :comments, class_name: 'User'
  has_many :likes
  has_many :user_likes, through: :likes

  validates :content, presence: true
  scope :right_order, -> { order(created_at: desc) }
end
