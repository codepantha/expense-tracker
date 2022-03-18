require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'expenses/index.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Prom', email: 'email@test.com', password: '123456')
    @group = Group.create!(user: @user, name: 'game', icon: 'game_icon')
    @expense = @group.expenses.create(user: @user, name: 'Legend of the kage', amount: 10)

    visit '/users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'email@test.com'
      fill_in 'user[password]', with: '123456'
    end
    click_button 'Log in'
  end

  it 'shows all the expenses in a group' do
    visit groups_path
    click_link @group.name
    expect(current_path).to eq(group_expenses_path(@group))
    expect(page).to have_content('Legend of the kage')
  end
end
