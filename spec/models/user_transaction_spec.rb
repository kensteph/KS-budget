require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  let(:user) { User.new(name: 'Roody', email: 'roody@mail.com') }
  let(:category) do
    Category.create(
      name: 'Housing',
      icon: 'https://picsum.photos/300/300',
      user_id: user
    )
  end
  let(:user_transaction) do
    UserTransaction.create(
      name: 'Curtains',
      amount: 200,
      author_id: user,
      category_id: category
    )
  end

  describe 'attributes' do
    it 'Should have a name' do
      expect(user_transaction.name).to eq('Curtains')
    end

    it 'Should have an amount of 200' do
      expect(user_transaction.amount).to eq(200)
    end

    it 'Should have Roody as user' do
      expect(user_transaction.author_id).to eq(user.id)
    end

    it 'Should have Housing as category' do
      expect(user_transaction.category_id).to eq(category.id)
    end
  end
end
