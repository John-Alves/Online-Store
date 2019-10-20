require 'rails_helper'

RSpec.describe "ProductEntries", type: :request do
  describe "GET /product_entries" do
    it "works! (now write some real specs)" do
      get product_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
