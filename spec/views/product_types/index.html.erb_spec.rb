require 'rails_helper'

RSpec.describe "@attribute_sets/terms", type: :view do
  before(:each) do
    assign(:attribute_sets, [
        AttributeSet.create!(
        :name => "Name"
      ),
        AttributeSet.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of @attribute_sets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
