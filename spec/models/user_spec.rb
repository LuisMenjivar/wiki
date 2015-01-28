require 'rails_helper'

RSpec.describe User, :type => :model do
  context "associations" do 
    it "has many wikys" do 
      expect(User.new).to have_many(:wikys)
    end 
  end 
  context ".create" do
    it "user role should default to standard" do 
      user = User.create!(email: "someone@test.tld", password: "password")
      expect(user.reload.role).to eq("standard")
    end 
  end

end
