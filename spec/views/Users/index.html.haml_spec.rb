require 'rails_helper'

RSpec.describe "people/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email",
        :mobile => "Mobile"
      ),
      User.create!(
        :name => "Name",
        :email => "Email",
        :mobile => "Mobile"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
  end
end
