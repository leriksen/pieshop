require 'spec_helper'

describe "user_types/show" do
  before(:each) do
    @user_type = assign(:user_type, stub_model(UserType,
      :typename => "Typename",
      :level => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Typename/)
    rendered.should match(/1/)
  end
end
