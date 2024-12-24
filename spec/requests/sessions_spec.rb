require 'rails_helper'

RSpec.describe "User Login", type: :request do
  describe "POST /users/sign_in" do
    let(:valid_attributes) do
      {
        "email": "john.doe@example.com",
        "password": "password"
      }
    end
  end

  context "when the request is valid" do
    it "creates a new user and redirect to the root path" do
      post user_session_path, params: valid_attributes
      follow_redirect!
      expect(response).to redirect_to(root_path)
    end
  end
end
