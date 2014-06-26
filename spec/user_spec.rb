require 'spec_helper'

describe User do
	let(:user) {User.new()}

	context "testing username validation" do
	    it "will be invalid when it doesn't have a username" do
		  expect(user.valid?).to be_false
	    end 
	    it "will be valid when it doesn't have a username" do
	      user.username = "name?"
		  expect(user.valid?).to be_true
	    end
    end 

    context "testing password validation" do
	    it "will be invalid when it doesn't have a password" do
		  expect(user.valid?).to be_false
	    end 
    end 
end