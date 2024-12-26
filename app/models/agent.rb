class Agent < ApplicationRecord
  belongs_to :lab
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
  before_save :set_latitude_and_longitude

  scope :recently_updated, -> { order(updated_at: :desc) }

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  private
  def set_latitude_and_longitude
    if address.city.present?
      location = "#{address.city}, #{address.zip}"
      coordinates = Geocoder.search(location).first&.coordinates

      latitude_adjustment = rand(-0.09..0.135)
      longitude_adjustment = rand(-0.09..0.135)

      if coordinates
        self.address.latitude = coordinates[0] + (0.5 + latitude_adjustment)
        self.address.longitude = coordinates[1] + (0.5 + longitude_adjustment)
      end
    end
  end
end
