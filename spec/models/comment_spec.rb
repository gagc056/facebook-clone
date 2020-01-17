# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'validates post presence' do
    comment = Coment.new
    comment.save
    expect(comment).to be_invalid
  end
end
