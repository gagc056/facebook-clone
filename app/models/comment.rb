class Comment < ApplicationRecord
  belongs_to :post_comment, class_name: 'Post'
  belongs_to :commenter, class_name: 'User'

end
