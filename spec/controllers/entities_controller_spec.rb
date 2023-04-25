require 'rails_helper'

RSpec.describe EntitiesController, type: :request do
  include Warden::Test::Helpers

  before do
    @user = User.create!(name: 'sambeck', email: 'sambeck@outlook.com', password: 'todoterreno')
    login_as(@user, scope: :user)
    @group = Group.create!(name: 'Home', icon:'https://www.iconarchive.com/download/i103430/paomedia/small-n-flat/house.512.png', user_id: @user.id)
  end

  describe 'GET #new' do
    before do
      get new_user_group_entity_path(user_id: @user.id, group_id:@group.id)
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'should displays the index template' do
      expect(response).to render_template(:new)
    end

    it 'should displays the correct page name' do
      expect(response.body).to include('TRANSACTIONS')
    end

    it 'should displays the fields' do
      expect(response.body).to include('Name')
      expect(response.body).to include('Amount')
    end

    it 'should displays the correct buttons' do
      expect(response.body).to include('Save')
      expect(response.body).to include('Log-out')
    end
  end
end
