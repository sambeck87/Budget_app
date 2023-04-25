require 'rails_helper'

RSpec.describe GroupsController, type: :request do
  include Warden::Test::Helpers

  before do
    @user = User.create!(name: 'sambeck', email: 'sambeck@outlook.com', password: 'todoterreno')
    login_as(@user, scope: :user)
    @group = Group.create!(name: 'Home', icon:'https://www.iconarchive.com/download/i103430/paomedia/small-n-flat/house.512.png', user_id: @user.id)
    @entity1 = Entity.create!(name:'table', amount:120.3, author_id: @user.id, groups:[@group])
    @entity2 = Entity.create!(name:'paint', amount:230.2, author_id: @user.id, groups:[@group])
  end

  describe 'GET #index' do
    before do
      get user_groups_path(user_id: @user.id)
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'should displays the index template' do
      expect(response).to render_template(:index)
    end

    it 'should displays the correct page name' do
      expect(response.body).to include('CATEGORIES')
    end

    it 'should displays the correct page name' do
      expect(response.body).to include('CATEGORIES')
    end

    it 'should displays the category name' do
      expect(response.body).to include('Home')
    end

    it 'should displays the total amount' do
      expect(response.body).to include('350.5')
    end
  end

  describe 'GET #new' do
    before do
      get new_user_group_path(user_id: @user.id)
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'should displays the new template' do
      expect(response).to render_template(:new)
    end

    it 'should displays the correct page name' do
      expect(response.body).to include('NEW CATEGORY')
    end

    it 'should displays the fields' do
      expect(response.body).to include('Category Name')
      expect(response.body).to include('URL_icon')
    end

    it 'should displays the correct buttons' do
      expect(response.body).to include('Save')
      expect(response.body).to include('Log-out')
    end
  end


  describe 'GET #show' do
    before do
      get user_group_path(user_id: @user.id, id: @group.id)
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'should displays the show template' do
      expect(response).to render_template(:show)
    end

    it 'should displays the correct page name' do
      expect(response.body).to include('TRANSACTIONS')
    end

    it 'should displays the total amount' do
      expect(response.body).to include('350.5')
    end

    it 'should displays the parcial amounts' do
      expect(response.body).to include('120.3')
      expect(response.body).to include('230.2')
    end


    it 'should displays the transactions name' do
      expect(response.body).to include('table')
      expect(response.body).to include('paint')
    end
  end
end
