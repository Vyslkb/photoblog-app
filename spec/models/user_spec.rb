require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:each) do
    @user = User.create!(name: "test name", email: "email@yahoo.com",
                         password: "asdfasdf")
  end
  
  describe "creation" do
    it "should result in 1 user" do
      expect(User.all.count).to eq 1
    end
  end
  
  describe "property validations" do
    it "should reject creating a user without an email address" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    
    it "should reject creating a user without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
  end
  
  describe "length validations" do
    it "should reject a name longer than 50 characterss" do
      @user.name = "a" * 51
      expect(@user).to_not be_valid
    end
  end
  
end