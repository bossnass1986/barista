require 'rails_helper'

RSpec.describe "@attribute_sets/edit", type: :view do
  before(:each) do
    @attribute_set = assign(:attribute_set, AttributeSet.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit @attribute_set form" do
    render

    assert_select "form[action=?][method=?]", product_type_path(@attribute_set), "post" do

      assert_select "input#product_type_name[name=?]", "@attribute_set[name]"
    end
  end
end
