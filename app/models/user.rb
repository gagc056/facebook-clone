# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  has_many :comments
  has_many :post_comments, through: :comments, class_name: 'Post'
  has_many :likes
  has_many :post_likes, through: :likes
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }

  def friends
    friends = friendships.map { |friendship| friendship.friend if friendship.status }
    friends += inverse_friendships.map { |friendship| friendship.user if friendship.status }
    friends.compact
  end

  def friendship_request
    inverse_friendships.map { |friendship| friendship.user unless friendship.status }.compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.status }.compact
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split(' ')[0]
      user.last_name = auth.info.name.split(' ')[1]   # assuming the user model has a name
      user.user_img = auth.info.image # assuming the user model has an image
    end
  def show_post
    @friend_post = friends.map(&:posts).flatten
    @friend_post += posts
    @friend_post.flatten
  end
end
