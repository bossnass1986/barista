require 'rails_helper'

RSpec.describe "venues/new", :type => :view do
  before(:each) do
    assign(:venue, Venue.new(
      :name => "MyString",
      :address => "MyString",
      :suburb => "MyString",
      :phone => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new venue form" do
    render

    assert_select "form[action=?][method=?]", venues_path, "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_address[name=?]", "venue[address]"

      assert_select "input#venue_suburb[name=?]", "venue[suburb]"

      assert_select "input#venue_phone[name=?]", "venue[phone]"

      assert_select "input#venue_latitude[name=?]", "venue[latitude]"

      assert_select "input#venue_longitude[name=?]", "venue[longitude]"
    end
  end
end
