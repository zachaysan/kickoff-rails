require 'spec_helper'

describe "Users API" do

  let(:user) { FactoryGirl.create(:user) }

  describe "GET /users/:id" do

    it "retrieves a user via user id" do
      get "/users/#{user.id}", {}, accept_json
      expect(response.status).to eq 200
      
      body = JSON.parse(response.body)
      expect(body["username"]).to eq user.username
      
    end

  end

  describe "GET /:username" do

    it "retrieves a user via username" do
      get "/#{user.username}", {}, accept_json
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["username"]).to eq user.username
    end

  end

  describe 'POST /users/' do

    let(:username) { "Lucky" }
    let(:password) { "hunter2" }
    let(:email)    { "lucky@example.com" }

    it "creates a user with a username and password" do
      user_params = { user: { username: username, password: password } }
        .to_json

      post "/users/", user_params, request_headers
      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      expect(body["username"]).to eq username
    end

    it "creates a user with an email and a password" do
      user_params = { user: { email: email, password: password } }
        .to_json

      post "/users/", user_params, request_headers
      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      expect(body["id"]).to_not be_nil
    end
    
    it "creates a user with both a username and an email"
  end
  
end
