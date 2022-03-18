require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  before :each do
    @user = User.create(name: 'Prom', email: 'email@test.com', password: '123456')
    @group = Group.create!(user: @user, name: 'game', icon: 'game_icon')
    @expense = @group.expenses.create(user: @user, name: 'Legend of the kage', amount: 10)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get groups_path
      expect(response).to render_template('index')
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_group_path
      expect(response).to render_template('new')
    end
  end
end
