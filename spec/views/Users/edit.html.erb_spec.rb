require 'rails_helper'

RSpec.describe "people/edit", :type => :view do
  before(:each) do
    user = assign(:user, User.create!(
      :name => "MyString",
      :email => "MyString",
      :mobile => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(user), "post" do

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_mobile[name=?]", "person[mobile]"
    end
  end
end
