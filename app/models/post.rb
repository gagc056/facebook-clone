# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :right_order, -> { order(created_at: desc) }
end
