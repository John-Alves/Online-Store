require 'rails_helper'

RSpec.describe "product_entries/edit", type: :view do
  before(:each) do
    @product_entry = assign(:product_entry, ProductEntry.create!(
      :payment_date => "MyString",
      :amount => 1,
      :price => "9.99",
      :observation => "MyString",
      :product => nil,
      :supplier => nil
    ))
  end

  it "renders the edit product_entry form" do
    render

    assert_select "form[action=?][method=?]", product_entry_path(@product_entry), "post" do

      assert_select "input[name=?]", "product_entry[payment_date]"

      assert_select "input[name=?]", "product_entry[amount]"

      assert_select "input[name=?]", "product_entry[price]"

      assert_select "input[name=?]", "product_entry[observation]"

      assert_select "input[name=?]", "product_entry[product_id]"

      assert_select "input[name=?]", "product_entry[supplier_id]"
    end
  end
end
