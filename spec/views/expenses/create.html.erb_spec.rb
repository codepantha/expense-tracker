require 'rails_helper'

RSpec.describe 'expenses/create.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Prom', email: 'email@test.com', password: '123456')
    @group = Group.create!(user: @user, name: 'game', icon: 'game_icon')

    visit '/users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'email@test.com'
      fill_in 'user[password]', with: '123456'
    end
    click_button 'Log in'
  end

  it 'adds a new expense' do
    visit new_group_expense_path(@group)
    within('#expense-form') do
      fill_in 'expense[name]', with: 'Kontra'
      fill_in 'expense[amount]', with: 9.75
    end
    click_button 'Create Expense'
    expect(page).to have_content('Kontra added successfully')
    expect(current_path).to eq(group_expenses_path(@group))
    expect(page).to have_content('Kontra')
  end
end
