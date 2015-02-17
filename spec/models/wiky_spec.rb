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

  describe ".search_for" do 
    it "searches for words in title or body of wiki" do 
      tomato_wiki = Wiky.create!(title: "tomato", body: "red fruit" )
      harry_wiki = Wiky.create!(title: "Harry Potter", body: "book series")
      expect(Wiky.search_for("tomato")).to match_array(
        Wiky.where("title LIKE '%#{"tomato"}%' OR body LIKE '%#{"tomato"}%'"))
      expect(Wiky.search_for("book")).not_to match_array(
        Wiky.where("title LIKE '%#{"tomato"}%' OR body LIKE '%#{"tomato"}%'"))
    end
  end
end