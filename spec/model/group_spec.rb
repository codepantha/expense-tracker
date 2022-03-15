require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    User.create!(name: 'Rudolf', email: 'rudolf@gmail.com', password: '123456')
  end

  subject { Group.new(user: user, name: 'Wears', icon: '(^-)') }

  before do
    Group.create!(user: user, name: 'Shoes', icon: '(^-)')
    subject.save 
  end

  it 'has accurate number of groups' do
    expect(Group.count).to eq(2)
  end

  it 'name field must not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon field must not be empty' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'user has 2 groups' do
    expect(user.groups.count).to eq(2)
  end

  it 'group belongs to user' do
    expect(subject.user).to be(user)
  end
end