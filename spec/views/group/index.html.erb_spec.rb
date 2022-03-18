require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'group/index.html.erb', type: :feature do
  before :each do
    @user = User.create(name: 'Prom', email: 'email@test.com', password: '123456')
    @group = Group.create!(user: @user, name: 'game', icon: 'game_icon')
    @group.expenses.create(user: @user, name: 'Legend of the kage', amount: 10)
    @group.expenses.create(user: @user, name: 'Kontra', amount: 11.25)

    visit '/users/sign_in'
    within('form') do
      fill_in 'user[email]', with: 'email@test.com'
      fill_in 'user[password]', with: '123456'
    end
    click_button 'Log in'
  end

  it 'shows all the groups along with details' do
    visit groups_path
    expect(page).to have_content('game')
    expect(page).to have_content('$21.25')
  end
end
