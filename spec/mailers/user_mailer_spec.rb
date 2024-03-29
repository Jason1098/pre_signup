require "spec_helper"

describe UserMailer do
  before(:all) do
  	@user = FactoryGirl.create(:user, email: "example@example.com")
  	@user - UserMailer.welcome_email(@user).deliver
	end

	it "should be delivered ot the email address provided" do
		@email.should deliver_to("evample@example.com")
	end

	it "should contain the correct message in the mail body" do
		@email.should have_body_text(/Welcome/)
	end

	it "should have the correct subject" do
		@email.should have_subject(/Request Received/)
	end
	
end

