require 'rails_helper'

RSpec.describe "@@property_sets/edit", type: :view do
  before(:each) do
    @property_set = assign(:property_set, PropertySet.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit @@property_set form" do
    render

    assert_select "form[action=?][method=?]", product_type_path(@property_set), "post" do

      assert_select "input#product_type_name[name=?]", "@@property_set[name]"
    end
  end
end
