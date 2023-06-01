require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Roody', email: 'roody@mail.com') }

  it 'the User has the correct name' do
    expect(user.name).to eq('Roody')
  end
  it 'returns User has the correct email' do
    expect(user.email).to eq('roody@mail.com')
  end
end
