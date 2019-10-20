require 'rails_helper'

RSpec.describe "product_exits/edit", type: :view do
  before(:each) do
    @product_exit = assign(:product_exit, ProductExit.create!(
      :amount => 1,
      :price => "9.99",
      :observation => "MyString",
      :comission => "9.99",
      :product => nil,
      :seller => nil
    ))
  end

  it "renders the edit product_exit form" do
    render

    assert_select "form[action=?][method=?]", product_exit_path(@product_exit), "post" do

      assert_select "input[name=?]", "product_exit[amount]"

      assert_select "input[name=?]", "product_exit[price]"

      assert_select "input[name=?]", "product_exit[observation]"

      assert_select "input[name=?]", "product_exit[comission]"

      assert_select "input[name=?]", "product_exit[product_id]"

      assert_select "input[name=?]", "product_exit[seller_id]"
    end
  end
end
