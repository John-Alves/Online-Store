require 'rails_helper'

RSpec.describe "subcategories/index", type: :view do
  before(:each) do
    assign(:subcategories, [
      Subcategory.create!(
        :description => "Description",
        :category => nil
      ),
      Subcategory.create!(
        :description => "Description",
        :category => nil
      )
    ])
  end

  it "renders a list of subcategories" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
