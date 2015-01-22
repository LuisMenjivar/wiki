require 'rails_helper'

RSpec.describe User, :type => :model do
  context "scope" do 
    it "has many wikys" do 
      expect(User.new).to have_many(:wikys)
    end 
  end 

end
