require 'spec_helper'

describe "user_types/index" do
  before(:each) do
    assign(:user_types, [
      stub_model(UserType,
        :typename => "Typename",
        :level => 1
      ),
      stub_model(UserType,
        :typename => "Typename",
        :level => 1
      )
    ])
  end

  it "renders a list of user_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Typename".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
