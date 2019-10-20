require 'rails_helper'

RSpec.describe "product_exits/show", type: :view do
  before(:each) do
    @product_exit = assign(:product_exit, ProductExit.create!(
      :amount => 2,
      :price => "9.99",
      :observation => "Observation",
      :comission => "9.99",
      :product => nil,
      :seller => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Observation/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
