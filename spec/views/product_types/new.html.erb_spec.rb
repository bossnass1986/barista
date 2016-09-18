require 'rails_helper'

RSpec.describe "@@property_sets/new", type: :view do
  before(:each) do
    assign(:property_set, PropertySet.new(
      :name => "MyString"
    ))
  end

  it "renders new @@property_set form" do
    render

    assert_select "form[action=?][method=?]", product_types_path, "post" do

      assert_select "input#product_type_name[name=?]", "@@property_set[name]"
    end
  end
end
