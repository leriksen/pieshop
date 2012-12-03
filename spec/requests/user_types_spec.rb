require 'spec_helper'

describe "UserTypes" do
  describe "GET /user_types" do
    it "cannot get user types if not logged in as admin" do
      get user_types_path
      response.status.should eq(302)
    end
  end
end
