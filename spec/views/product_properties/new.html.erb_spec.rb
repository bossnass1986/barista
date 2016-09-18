require 'rails_helper'

RSpec.describe "@product_attributes/new", type: :view do
  before(:each) do
    assign(:product_attribute, ProductAttribute.new(
      :variant_id => 1,
      :property_id => 1
    ))
  end

  it "renders new @product_attribute form" do
    render

    assert_select "form[action=?][method=?]", product_properties_path, "post" do

      assert_select "input#product_property_product_id[name=?]", "@product_attribute[product_id]"

      assert_select "input#product_property_property_id[name=?]", "@product_attribute[property_id]"
    end
  end
end
