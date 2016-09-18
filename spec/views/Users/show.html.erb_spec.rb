require 'rails_helper'

RSpec.describe "people/terms", :type => :view do
  before(:each) do
    user = assign(:user, User.create!(
      :name => "Name",
      :email => "Email",
      :mobile => "Mobile"
    ))
  end

  it "renders properties in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Mobile/)
  end
end
