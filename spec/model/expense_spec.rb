require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) do
    User.create!(name: 'Rudolf', email: 'rudolf@gmail.com', password: '123456')
  end

  subject do
    Expense.new(user: user, name: 'Bicycle', amount: 25000)
  end

  before do
    Expense.create!(user: user, name: 'Gucci Jacket', amount: 1300000)
    subject.save
  end

  it 'count is accurate' do
    expect(Expense.count).to eq(2)
  end

  it 'name field must not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount field must not be empty' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount must be of numerical type' do
    subject.amount = 'thirty'
    expect(subject).to_not be_valid
  end

  it 'user has many expenses' do
    expect(user.expenses.count).to eq(2)
  end

  it 'belongs to a user' do
    expect(subject.user).to be(user)
  end
end