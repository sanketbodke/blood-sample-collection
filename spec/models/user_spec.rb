# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
    end
  end
end
