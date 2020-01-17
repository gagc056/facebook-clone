require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'validates a user presence' do
    like=Like.new
    like.save
    expect(like).to be_invalid
  end
end
