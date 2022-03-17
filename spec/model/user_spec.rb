require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Sarah', email: 'sarah@bartmaan.com', password: '123456')
  end

  before do
    User.create!(name: 'Sina', email: 'sina@gmail.com', password: '123456')
    User.create!(name: 'Tife', email: 'tife@gmail.com', password: '123456')
    subject.save
  end

  it 'shows the number of saved users' do
    expect(User.count).to eq(3)
  end

  it 'name field must not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
