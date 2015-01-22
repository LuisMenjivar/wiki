require 'rails_helper'

RSpec.describe "wikies/new", :type => :view do
  before(:each) do
    assign(:wiky, Wiky.new(
      :title => "MyString",
      :body => "MyText",
      :user => nil
    ))
  end

  it "renders new wiky form" do
    render

    assert_select "form[action=?][method=?]", wikies_path, "post" do

      assert_select "input#wiky_title[name=?]", "wiky[title]"

      assert_select "textarea#wiky_body[name=?]", "wiky[body]"

      assert_select "input#wiky_user_id[name=?]", "wiky[user_id]"
    end
  end
end
