class User < ApplicationRecord
  belongs_to :lab, optional: true
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
