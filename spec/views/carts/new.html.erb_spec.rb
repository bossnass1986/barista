require 'rails_helper'

RSpec.describe "carts/new", type: :view do
  before(:each) do
    assign(:cart, Cart.new(
      :user_id => 1,
      :customer_id => 1
    ))
  end

  it "renders new cart form" do
    render

    assert_select "form[action=?][method=?]", carts_path, "post" do

      assert_select "input#cart_user_id[name=?]", "cart[user_id]"

      assert_select "input#cart_customer_id[name=?]", "cart[customer_id]"
    end
  end
end
