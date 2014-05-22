require 'spec_helper'

describe AccessToken do

  let(:access_token) { FactoryGirl.create(:access_token) }

  it "has a valid factory" do
    expect( access_token.class ).to eq AccessToken
    expect( access_token ).to be_valid
  end

  it "has a token" do
    expect( access_token.token ).to_not be_nil
  end

  it "has a user" do
    expect( access_token.user ).to_not be_nil
  end

  it "is invalid without a token" do
    access_token.token = nil
    expect( access_token ).to_not be_valid
  end

  it "has a user" do
    access_token.user = nil
    expect( access_token ).to_not be_valid
  end

end
