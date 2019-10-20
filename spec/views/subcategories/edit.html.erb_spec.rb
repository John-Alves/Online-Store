require 'rails_helper'

RSpec.describe "subcategories/edit", type: :view do
  before(:each) do
    @subcategory = assign(:subcategory, Subcategory.create!(
      :description => "MyString",
      :category => nil
    ))
  end

  it "renders the edit subcategory form" do
    render

    assert_select "form[action=?][method=?]", subcategory_path(@subcategory), "post" do

      assert_select "input[name=?]", "subcategory[description]"

      assert_select "input[name=?]", "subcategory[category_id]"
    end
  end
end
