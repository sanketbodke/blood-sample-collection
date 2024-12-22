class Agent < ApplicationRecord
  belongs_to :lab
  has_one :address
end
