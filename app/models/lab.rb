class Lab < ApplicationRecord
  belongs_to :user, optional: true
  has_many :agents
  has_one :address, as: :addressable, dependent: :destroy

  accepts_nested_attributes_for :address
end
