require 'rails_helper'

RSpec.describe "User Registrations", type: :request do
  describe "POST /users" do
    let(:valid_attributes) do
      {
        user: {
          first_name: "John",
          last_name: "Doe",
          email: "john.doe@example.com",
          password: "password",
          password_confirmation: "password",
          is_lab: "1"
        }
      }
    end

    let(:invalid_attributes) do
      {
        user: {
          first_name: "John",
          last_name: "Doe",
          email: "john.doeexample.com",
          password: "password",
          password_confirmation: "paswo",
          is_lab: "1"
        }
      }
    end

    context "when the request is valid" do
      it "creates a new user and redirects to the root path" do
        post user_registration_path, params: valid_attributes
        follow_redirect!
        expect(response).to redirect_to(root_path)
      end
    end

    context "when the request is valid" do
      it "creates a new user and redirects to the root path" do
        post user_registration_path, params: valid_attributes
        follow_redirect!
        expect(response).to redirect_to(root_path)
      end
    end

    context "when the request is invalid" do
      it "does not create a new user" do
        expect {
          post user_registration_path, params: invalid_attributes
        }.not_to change(User, :count)
      end
    end
  end
end
