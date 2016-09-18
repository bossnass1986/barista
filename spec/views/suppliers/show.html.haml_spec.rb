require 'rails_helper'

RSpec.describe "merchants/terms", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Merchant.create!(
      :name => "Name",
      :address => "Address",
      :latitude => 1.5,
      :longitude => 1.5,
      :email => "Email",
      :phone => "Phone"
    ))
  end

  it "renders properties in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
  end
end
