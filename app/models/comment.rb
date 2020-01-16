class Comment < ApplicationRecord
  belongs_to :post_comment, foreign_key: 'post_id'  ,class_name: 'Post'
  belongs_to :commenter, foreign_key: 'user_id', class_name: 'User'
  
  scope :right_order, -> { order(created_at: :desc) }
end
