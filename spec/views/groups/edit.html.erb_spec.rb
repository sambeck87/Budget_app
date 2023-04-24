require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  let(:group) {
    Group.create!(
      name: "MyText",
      icon: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:group, group)
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(group), "post" do

      assert_select "textarea[name=?]", "group[name]"

      assert_select "textarea[name=?]", "group[icon]"

      assert_select "input[name=?]", "group[user_id]"
    end
  end
end
