require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) do
    User.create(
      first_name: 'Carlos',
      last_name: 'Tevez',
      email: 'tevez@gmail.com',
      password: '12345678',
      password_confirmation: '12345678',
      date_birth: '19/7/1980',
      gender: 'male'
    )
  end

  let(:friend) do
    User.create(
      first_name: 'Cristiano',
      last_name: 'Ronaldo',
      email: 'cristiano7@gmail.com',
      password: '12345678',
      password_confirmation: '12345678',
      date_birth: '19/7/1983',
      gender: 'male'
    )
  end

  let(:friendship) do
    Friendship.new(user_id: user.id, friend_id: friend.id)
  end

  it 'validates if has an friend' do
    expect(friendship).to be_valid
  end

  it 'validates if has an friend' do   
    friendship.friend = nil
    expect(friendship).to_not be_valid
  end

  it 'receives a friend request' do   
    user.friendships.build(friend_id: friend.id)
    expect(user.friendships.first.friend).to eq(friend)
  end
end
