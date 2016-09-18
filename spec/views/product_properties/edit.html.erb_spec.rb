require 'rails_helper'

RSpec.describe "@product_attributes/edit", type: :view do
  before(:each) do
    @product_attribute = assign(:product_attribute, ProductAttribute.create!(
      :variant_id => 1,
      :property_id => 1
    ))
  end

  it "renders the edit @product_attribute form" do
    render

    assert_select "form[action=?][method=?]", product_property_path(@product_attribute), "post" do

      assert_select "input#product_property_product_id[name=?]", "@product_attribute[product_id]"

      assert_select "input#product_property_property_id[name=?]", "@product_attribute[property_id]"
    end
  end
end
