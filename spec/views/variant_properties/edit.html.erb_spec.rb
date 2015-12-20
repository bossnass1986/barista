require 'rails_helper'

RSpec.describe "variant_properties/edit", type: :view do
  before(:each) do
    @variant_property = assign(:variant_property, VariantProperty.create!(
      :variant_id => 1,
      :property_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit variant_property form" do
    render

    assert_select "form[action=?][method=?]", variant_property_path(@variant_property), "post" do

      assert_select "input#variant_property_variant_id[name=?]", "variant_property[variant_id]"

      assert_select "input#variant_property_property_id[name=?]", "variant_property[property_id]"

      assert_select "input#variant_property_name[name=?]", "variant_property[name]"
    end
  end
end
