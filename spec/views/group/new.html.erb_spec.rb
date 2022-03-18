require 'rails_helper'

RSpec.describe 'group/new.html.erb', type: :feature do
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

  it 'it shows the form to add new expense' do
    visit new_group_path
    expect(page).to have_field('group[name]')
    expect(page).to have_field('group[icon]')
  end
end
