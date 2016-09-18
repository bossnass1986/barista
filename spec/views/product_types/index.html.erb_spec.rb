require 'rails_helper'

RSpec.describe "@@property_sets/terms", type: :view do
  before(:each) do
    assign(:property_sets, [
        PropertySet.create!(
        :name => "Name"
      ),
        PropertySet.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of @@property_sets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
