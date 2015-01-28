require "rails_helper"

describe WikyPolicy do

  subject { described_class }

  permissions :update? do
    
    it "does not allow visitors to update any wiky" do
      expect(subject).not_to permit(nil, Wiky.new(public: true))
      expect(subject).not_to permit(nil, Wiky.new(public: false))
    end

    it "does not allow standard user to update private wikys" do
      private_wiki = Wiky.new(public: false)
      expect(subject).not_to permit(User.new(role: :standard), private_wiki)
    end

    it "allows premium users to update their private wikys" do
      user = User.new(role: :premium)
      private_wiki = user.wikys.build(public: false)
      expect(subject).to permit(user, private_wiki)
    end

    it "allows admin users to update any private wiky" do
      admin = User.new(role: :admin)
      private_wiki = Wiky.new(public: false)
      expect(subject).to permit(admin, private_wiki)
    end
  end
end