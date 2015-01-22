require 'rails_helper'

RSpec.describe "wikies/index", :type => :view do
  before(:each) do
    assign(:wikies, [
      Wiky.create!(
        :title => "Title",
        :body => "MyText",
        :user => nil
      ),
      Wiky.create!(
        :title => "Title",
        :body => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of wikies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
