require 'spec_helper'

describe Email do
  
  let(:email) { FactoryGirl.create(:email) }

  it "has a valid factory" do
    expect(email).to be_valid
  end

end
