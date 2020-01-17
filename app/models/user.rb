# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :post_comments, through: :comments, class_name: 'Post'
  has_many :likes
  has_many :post_likes, through: :likes
  has_many :friendships
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :date_birth, presence: true
  validates :gender, presence: true, inclusion: { in: %w[male female] }

  def friends
    friends= friendships.map {|friendship| friendship.friend if friendship.status}
    friends.compact
  end

  def friendship_request
    friends= friendships.map {|friendship| friendship.friend if !friendship.status}
    friends.compact
  end
end
