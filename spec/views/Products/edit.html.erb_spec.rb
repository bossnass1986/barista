require 'spec_helper'

describe "Products/edit" do
  before(:each) do
    product = assign(:products, stub_model(Product,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menu_items_path(product), :method => "post" do
      assert_select "input#menu_item_name", :name => "product[name]"
      assert_select "input#menu_item_description", :name => "product[description]"
    end
  end
end
