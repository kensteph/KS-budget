require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.new(name: 'Roody', email: 'roody@mail.com') }
  let(:category) do
    Category.create(
      name: 'Housing',
      icon: 'https://picsum.photos/300/300',
      user_id: user
    )
  end

  describe 'attributes' do
    it 'Should have a name' do
      expect(category.name).to eq('Housing')
    end

    it 'Should have an icon' do
      expect(category.icon).to eq('https://picsum.photos/300/300')
    end
  end
end
