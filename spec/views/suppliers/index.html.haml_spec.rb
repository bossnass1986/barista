require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        :name => "Name",
        :address => "Address",
        :latitude => 1.5,
        :longitude => 1.5,
        :email => "Email",
        :phone => "Phone"
      ),
      Supplier.create!(
        :name => "Name",
        :address => "Address",
        :latitude => 1.5,
        :longitude => 1.5,
        :email => "Email",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
