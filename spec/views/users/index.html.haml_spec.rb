require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "email1@example.com",
        :password_digest => "Password Digest",
        :user_type_id => 1
      ),
      stub_model(User,
        :email => "email2@example.com",
        :password_digest => "Password Digest",
        :user_type_id => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "email1@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "email2@example.com".to_s, :count => 1
  end
end
