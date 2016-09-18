require 'rails_helper'

RSpec.describe "@@property_sets/terms", type: :view do
  before(:each) do
    @property_set = assign(:property_set, PropertySet.create!(
      :name => "Name"
    ))
  end

  it "renders properties in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
