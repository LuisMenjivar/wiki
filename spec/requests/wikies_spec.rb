require 'rails_helper'

RSpec.describe "Wikies", :type => :request do
  describe "GET /wikies" do
    it "works! (now write some real specs)" do
      get wikies_path
      expect(response).to have_http_status(200)
    end
  end
end
