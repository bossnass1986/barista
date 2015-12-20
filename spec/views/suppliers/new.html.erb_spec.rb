require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, Supplier.new(
      :name => "MyString",
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :email => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

      assert_select "input#supplier_name[name=?]", "supplier[name]"

      assert_select "input#supplier_address[name=?]", "supplier[address]"

      assert_select "input#supplier_latitude[name=?]", "supplier[latitude]"

      assert_select "input#supplier_longitude[name=?]", "supplier[longitude]"

      assert_select "input#supplier_email[name=?]", "supplier[email]"

      assert_select "input#supplier_phone[name=?]", "supplier[phone]"
    end
  end
end
