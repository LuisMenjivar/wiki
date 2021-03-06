require 'rails_helper'

RSpec.describe "wikies/edit", :type => :view do
  before(:each) do
    @wiky = assign(:wiky, Wiky.create!(
      :title => "MyString",
      :body => "MyText",
      :user => nil
    ))
    @user =  create(:user)
    sign_in @user
  end

  it "renders the edit wiky form" do
    render

    assert_select "form[action=?][method=?]", wiky_path(@wiky), "post" do

      assert_select "input#wiky_title[name=?]", "wiky[title]"

      assert_select "textarea#wiky_body[name=?]", "wiky[body]"
    end
  end
end
