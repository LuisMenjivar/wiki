require "pundit/rspec"

describe "WikyPolicy" do

  subject { described_class }

  permissions :update? do
    
    it "does not allow visitors to update any wiky" do
      
    end

    it "does not allow standard user to update private wikys" do
      expect(subject).to permit(User.new(role: :nil), Post.new( public: :true))
    end

    it "allows premium users to update their private wikys" do
      expect(subject).to permit(User.new(role: :premium), Post.new( public: :false))
    end
  end
end