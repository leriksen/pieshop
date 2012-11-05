require 'spec_helper'

describe UserType do
	it "has a factory that creates a valid user" do
		build(:user_type).should be_valid
	end
end
