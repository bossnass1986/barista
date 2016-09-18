require 'rails_helper'

RSpec.describe "@attribute_sets/terms", type: :view do
  before(:each) do
    @attribute_set = assign(:attribute_set, AttributeSet.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
