require 'rails_helper'

RSpec.describe "welcome/index.html.erb", :type => :view do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "welcome.index.html.erb" do 
    it "show a welcome page " do 
      render
      expect(rendered).to include("Welcome to wiki") 
    end 
  end 
end
