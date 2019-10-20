require 'rails_helper'

RSpec.describe "ProductExits", type: :request do
  describe "GET /product_exits" do
    it "works! (now write some real specs)" do
      get product_exits_path
      expect(response).to have_http_status(200)
    end
  end
end
