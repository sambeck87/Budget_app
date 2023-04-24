require 'rails_helper'

RSpec.describe "entities/new", type: :view do
  before(:each) do
    assign(:entity, Entity.new(
      name: "MyText",
      amount: "9.99",
      user: nil
    ))
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do

      assert_select "textarea[name=?]", "entity[name]"

      assert_select "input[name=?]", "entity[amount]"

      assert_select "input[name=?]", "entity[user_id]"
    end
  end
end
