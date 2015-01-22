require 'rails_helper'

RSpec.describe Wiky, :type => :model do
  context "scope" do 
    it "belongs to user" do 
      expect(Wiky.new).to belong_to(:user)
    end 
  end 

end
