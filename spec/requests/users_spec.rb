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
    it "creates a user with a username and password" do
      username, password = "lucky", "hunter2"
      user_params = { user: { username: username, password: password } }
        .to_json

      post "/users/", user_params, request_headers

      expect(response.status).to eq 201

      body = JSON.parse(response.body)
      expect(body["username"]).to eq username
    end

    it "creates a user with an email and a password"
    it "creates a user with both a username and an email"
  end
  
end
