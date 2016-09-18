require 'rails_helper'

RSpec.describe "@attribute_sets/new", type: :view do
  before(:each) do
    assign(:attribute_set, AttributeSet.new(
      :name => "MyString"
    ))
  end

  it "renders new @attribute_set form" do
    render

    assert_select "form[action=?][method=?]", product_types_path, "post" do

      assert_select "input#product_type_name[name=?]", "@attribute_set[name]"
    end
  end
end
