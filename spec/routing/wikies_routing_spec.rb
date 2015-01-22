require "rails_helper"

RSpec.describe WikiesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/wikies").to route_to("wikies#index")
    end

    it "routes to #new" do
      expect(:get => "/wikies/new").to route_to("wikies#new")
    end

    it "routes to #show" do
      expect(:get => "/wikies/1").to route_to("wikies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/wikies/1/edit").to route_to("wikies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/wikies").to route_to("wikies#create")
    end

    it "routes to #update" do
      expect(:put => "/wikies/1").to route_to("wikies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wikies/1").to route_to("wikies#destroy", :id => "1")
    end

  end
end
