require "rails_helper"

RSpec.describe ProductEntriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/product_entries").to route_to("product_entries#index")
    end

    it "routes to #new" do
      expect(:get => "/product_entries/new").to route_to("product_entries#new")
    end

    it "routes to #show" do
      expect(:get => "/product_entries/1").to route_to("product_entries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_entries/1/edit").to route_to("product_entries#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/product_entries").to route_to("product_entries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_entries/1").to route_to("product_entries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_entries/1").to route_to("product_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_entries/1").to route_to("product_entries#destroy", :id => "1")
    end
  end
end
