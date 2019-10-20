require 'rails_helper'

RSpec.describe "product_entries/index", type: :view do
  before(:each) do
    assign(:product_entries, [
      ProductEntry.create!(
        :payment_date => "Payment Date",
        :amount => 2,
        :price => "9.99",
        :observation => "Observation",
        :product => nil,
        :supplier => nil
      ),
      ProductEntry.create!(
        :payment_date => "Payment Date",
        :amount => 2,
        :price => "9.99",
        :observation => "Observation",
        :product => nil,
        :supplier => nil
      )
    ])
  end

  it "renders a list of product_entries" do
    render
    assert_select "tr>td", :text => "Payment Date".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Observation".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
