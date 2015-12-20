require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :name => "MyString",
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5,
      :email => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do

      assert_select "input#supplier_name[name=?]", "supplier[name]"

      assert_select "input#supplier_address[name=?]", "supplier[address]"

      assert_select "input#supplier_latitude[name=?]", "supplier[latitude]"

      assert_select "input#supplier_longitude[name=?]", "supplier[longitude]"

      assert_select "input#supplier_email[name=?]", "supplier[email]"

      assert_select "input#supplier_phone[name=?]", "supplier[phone]"
    end
  end
end
