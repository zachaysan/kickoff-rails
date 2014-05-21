require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  it "has a valid factory" do
    expect( user ).to be_valid
  end

  it "is invalid without a username or email" do
    user.username = nil
    user.owned_emails.destroy_all
    expect( user ).to_not be_valid
  end

  it "is valid without email, but with a username" do
    user.owned_emails.destroy_all
    expect( user ).to be_valid
  end

  it "is valid without a username, but with a email" do
    user.username = nil
    expect( user ).to be_valid
  end

  it "shows a list of owned emails" do
    expect( user.owned_emails.first.class ).to be( Email )
  end

end
