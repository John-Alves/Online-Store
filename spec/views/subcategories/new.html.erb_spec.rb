require 'rails_helper'

RSpec.describe "subcategories/new", type: :view do
  before(:each) do
    assign(:subcategory, Subcategory.new(
      :description => "MyString",
      :category => nil
    ))
  end

  it "renders new subcategory form" do
    render

    assert_select "form[action=?][method=?]", subcategories_path, "post" do

      assert_select "input[name=?]", "subcategory[description]"

      assert_select "input[name=?]", "subcategory[category_id]"
    end
  end
end
