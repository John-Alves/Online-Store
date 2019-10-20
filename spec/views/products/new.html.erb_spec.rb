require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :title => "MyString",
      :description => "MyString",
      :comission => "9.99",
      :category => nil,
      :subcategory => nil
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[comission]"

      assert_select "input[name=?]", "product[category_id]"

      assert_select "input[name=?]", "product[subcategory_id]"
    end
  end
end
