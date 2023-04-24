require 'rails_helper'

RSpec.describe "entities/show", type: :view do
  before(:each) do
    assign(:entity, Entity.create!(
      name: "MyText",
      amount: "9.99",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
