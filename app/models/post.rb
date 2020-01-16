# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :user
  has_many :likes, through: :user

  validates :content, presence: true
  scope :right_order, -> { order(created_at: desc) }
end
