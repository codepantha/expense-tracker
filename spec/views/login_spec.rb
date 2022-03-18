require 'rails_helper'
require 'capybara/rspec'

describe 'Sign in', type: :feature do
  before :each do
    user = User.new(name: 'Prom', email: 'email@test.com', password: '123456')
    user.save
  end

  it 'I can see the login input fields' do
    visit '/users/sign_in'
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    expect(page).to have_button('Log in')
    expect(page).to have_content('Log in')
  end

  it 'Submitting an empty form shows an error' do
    visit '/users/sign_in'
    within('form') do
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
