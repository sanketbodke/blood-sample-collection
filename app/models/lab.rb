class Lab < ApplicationRecord
  has_many :users
  has_many :agents
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :address
end
