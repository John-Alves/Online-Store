require 'rails_helper'

RSpec.describe "sellers/edit", type: :view do
  before(:each) do
    @seller = assign(:seller, Seller.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit seller form" do
    render

    assert_select "form[action=?][method=?]", seller_path(@seller), "post" do

      assert_select "input[name=?]", "seller[name]"
    end
  end
end
