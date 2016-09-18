require 'rails_helper'

RSpec.describe "variants/terms", type: :view do
  before(:each) do
    @variant = assign(:variant, Variant.create!(
      :variant_id => 1,
      :price => "9.99",
      :cost => "9.99"
    ))
  end

  it "renders properties in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
