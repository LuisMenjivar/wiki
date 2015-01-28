require 'rails_helper'

RSpec.describe "Wikies", :type => :request do
 
  describe "GET /wikies" do
    it "success when logged in" do
      sign_in_as_a_valid_user
      get wikies_path
      expect(response).to have_http_status(200)
    end
    it "redirects to sign up page when not signed in" do 
      get wikies_path
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(root_path)
    end

  end
end
