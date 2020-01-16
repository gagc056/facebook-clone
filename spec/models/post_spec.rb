# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      first_name: 'Carlos',
      last_name: 'Tevez',
      email: 'tevez@gmail.com',
      password: '12345',
      password_confirmation: '12345',
      date_birth: 19 / 7 / 1980,
      gender: 'male'
    )
  end
  it 'validate it has a creator' do
    post = user.posts.build(content: 'welcome to facebook')
    expect(post.user.id).to eq(user.id)
  end
end
