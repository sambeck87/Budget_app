require 'rails_helper'

RSpec.describe 'groups/show', type: :view do
  before(:each) do
    assign(:group, Group.create!(
                     name: 'MyText',
                     icon: 'MyText',
                     user: nil
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
