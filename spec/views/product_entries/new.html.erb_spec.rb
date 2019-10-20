require 'rails_helper'

RSpec.describe "product_entries/new", type: :view do
  before(:each) do
    assign(:product_entry, ProductEntry.new(
      :payment_date => "MyString",
      :amount => 1,
      :price => "9.99",
      :observation => "MyString",
      :product => nil,
      :supplier => nil
    ))
  end

  it "renders new product_entry form" do
    render

    assert_select "form[action=?][method=?]", product_entries_path, "post" do

      assert_select "input[name=?]", "product_entry[payment_date]"

      assert_select "input[name=?]", "product_entry[amount]"

      assert_select "input[name=?]", "product_entry[price]"

      assert_select "input[name=?]", "product_entry[observation]"

      assert_select "input[name=?]", "product_entry[product_id]"

      assert_select "input[name=?]", "product_entry[supplier_id]"
    end
  end
end
