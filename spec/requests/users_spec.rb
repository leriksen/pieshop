require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    it "cannot get users if not logged in as admin" do
      get users_path
      response.status.should eq(302)
    end
  end
end
