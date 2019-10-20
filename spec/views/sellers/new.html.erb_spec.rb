require 'rails_helper'

RSpec.describe "sellers/new", type: :view do
  before(:each) do
    assign(:seller, Seller.new(
      :name => "MyString"
    ))
  end

  it "renders new seller form" do
    render

    assert_select "form[action=?][method=?]", sellers_path, "post" do

      assert_select "input[name=?]", "seller[name]"
    end
  end
end
