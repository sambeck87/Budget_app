require 'rails_helper'

RSpec.describe 'entities/edit', type: :view do
  let(:entity) do
    Entity.create!(
      name: 'MyText',
      amount: '9.99',
      user: nil
    )
  end

  before(:each) do
    assign(:entity, entity)
  end

  it 'renders the edit entity form' do
    render

    assert_select 'form[action=?][method=?]', entity_path(entity), 'post' do
      assert_select 'textarea[name=?]', 'entity[name]'

      assert_select 'input[name=?]', 'entity[amount]'

      assert_select 'input[name=?]', 'entity[user_id]'
    end
  end
end
