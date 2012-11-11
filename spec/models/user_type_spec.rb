require 'spec_helper'

describe UserType do
	it "has a factory that creates a valid user type" do
		build(:user_type).should be_valid
	end
	
  it "prevents the creation of duplicate user types" do
		type1 = create(:user_type)
		build(:user_type, typename: type1.typename).should_not be_valid
	end

  it "can determine if it is an administrator user_type" do
    build(:admin_user_type).is_admin?.should be_true
  end
end
