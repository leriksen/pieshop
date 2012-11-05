require 'spec_helper'

describe "user_types/edit" do
  before(:each) do
    @user_type = assign(:user_type, stub_model(UserType,
      :typename => "MyString",
      :level => 1
    ))
  end

  it "renders the edit user_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_types_path(@user_type), :method => "post" do
      assert_select "input#user_type_typename", :name => "user_type[typename]"
      assert_select "input#user_type_level", :name => "user_type[level]"
    end
  end
end
