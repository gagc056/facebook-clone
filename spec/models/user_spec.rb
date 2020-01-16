require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates if the user attributes are correct' do
    user=User.new(first_name:'ed', last_name:'morales', email:'', password:'', date_birth:13/10/1990, gender:'male' )
    expect(user).to be_invalid
  end
end
