require 'rails_helper'

RSpec.describe "product_entries/show", type: :view do
  before(:each) do
    @product_entry = assign(:product_entry, ProductEntry.create!(
      :payment_date => "Payment Date",
      :amount => 2,
      :price => "9.99",
      :observation => "Observation",
      :product => nil,
      :supplier => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Payment Date/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Observation/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
