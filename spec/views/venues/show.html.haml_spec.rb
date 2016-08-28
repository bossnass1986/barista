require 'rails_helper'

RSpec.describe "venues/terms", :type => :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "Name",
      :address => "Address",
      :suburb => "Suburb",
      :phone => "Phone",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Suburb/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
