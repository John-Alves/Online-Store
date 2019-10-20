require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :title => "MyString",
      :description => "MyString",
      :comission => "9.99",
      :category => nil,
      :subcategory => nil
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[title]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[comission]"

      assert_select "input[name=?]", "product[category_id]"

      assert_select "input[name=?]", "product[subcategory_id]"
    end
  end
end
