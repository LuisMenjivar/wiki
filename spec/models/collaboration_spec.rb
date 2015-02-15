require 'rails_helper'

RSpec.describe Collaboration, :type => :model do
  context "associations" do
    it "belongs to user" do
      expect(Collaboration.new).to belong_to(:user)
    end
    it "belong to wiky" do
      expect(Collaboration.new).to belong_to(:wiky) 
    end  
  end
end
