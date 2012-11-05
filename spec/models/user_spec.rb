require 'spec_helper'

describe User do
  it "has a factory that, by default, creates a valid user" do
    build(:user).should be_valid
  end
  it "prevents the creation of dunplicate users" do
    user1 = create(:user)
    build(:user, email: user1.email).should_not be_valid
  end
end