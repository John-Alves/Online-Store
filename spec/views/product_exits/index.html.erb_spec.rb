require 'rails_helper'

RSpec.describe "product_exits/index", type: :view do
  before(:each) do
    assign(:product_exits, [
      ProductExit.create!(
        :amount => 2,
        :price => "9.99",
        :observation => "Observation",
        :comission => "9.99",
        :product => nil,
        :seller => nil
      ),
      ProductExit.create!(
        :amount => 2,
        :price => "9.99",
        :observation => "Observation",
        :comission => "9.99",
        :product => nil,
        :seller => nil
      )
    ])
  end

  it "renders a list of product_exits" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Observation".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
