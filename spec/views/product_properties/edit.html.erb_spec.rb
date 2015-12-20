require 'rails_helper'

RSpec.describe "product_properties/edit", type: :view do
  before(:each) do
    @product_property = assign(:product_property, ProductProperty.create!(
      :variant_id => 1,
      :property_id => 1
    ))
  end

  it "renders the edit product_property form" do
    render

    assert_select "form[action=?][method=?]", product_property_path(@product_property), "post" do

      assert_select "input#product_property_product_id[name=?]", "product_property[product_id]"

      assert_select "input#product_property_property_id[name=?]", "product_property[property_id]"
    end
  end
end
