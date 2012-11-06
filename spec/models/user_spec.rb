require 'spec_helper'

describe User do
  it "has a factory that, by default, creates a valid user" do
    build(:user).should be_valid
  end
  it "prevents the creation of dunplicate users" do
    build(:user, email: create(:user).email).should_not be_valid
  end
end