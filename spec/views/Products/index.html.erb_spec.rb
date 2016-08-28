require 'spec_helper'

describe "Products/show" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Product,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of Products" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
