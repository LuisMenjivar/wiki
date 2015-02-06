require 'rails_helper'

RSpec.describe Wiky, :type => :model do
  context "associations" do 
    it "belongs to user" do 
      expect(Wiky.new).to belong_to(:user)
    end 
    it "has many collaborators through collaborations" do 
      expect(Wiky.new).to have_many(:collaborators).through(:collaborations)
    end

  end 
  context "create" do 
    it "wiky defaults to public " do 
      wiky = create(:wiky)
      expect((wiky.reload).public).to eq(true) 
    end 
  end
end
