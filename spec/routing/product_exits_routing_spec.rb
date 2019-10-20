require "rails_helper"

RSpec.describe ProductExitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/product_exits").to route_to("product_exits#index")
    end

    it "routes to #new" do
      expect(:get => "/product_exits/new").to route_to("product_exits#new")
    end

    it "routes to #show" do
      expect(:get => "/product_exits/1").to route_to("product_exits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_exits/1/edit").to route_to("product_exits#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/product_exits").to route_to("product_exits#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_exits/1").to route_to("product_exits#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_exits/1").to route_to("product_exits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_exits/1").to route_to("product_exits#destroy", :id => "1")
    end
  end
end
