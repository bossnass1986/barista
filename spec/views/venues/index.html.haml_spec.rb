require 'rails_helper'

RSpec.describe "venues/show", :type => :view do
  before(:each) do
    assign(:venues, [
      Venue.create!(
        :name => "Name",
        :address => "Address",
        :suburb => "Suburb",
        :phone => "Phone",
        :latitude => 1.5,
        :longitude => 1.5
      ),
      Venue.create!(
        :name => "Name",
        :address => "Address",
        :suburb => "Suburb",
        :phone => "Phone",
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
