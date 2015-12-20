require 'spec_helper'

describe "Products/new" do
  before(:each) do
    assign(:products, stub_model(Product,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menu_items_path, :method => "post" do
      assert_select "input#menu_item_name", :name => "product[name]"
      assert_select "input#menu_item_description", :name => "product[description]"
    end
  end
end
