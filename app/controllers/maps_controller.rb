class MapsController < ApplicationController
  def service_map
    @addresses = Address.select(:latitude, :longitude, :street, :city, :state, :zip)
                        .where.not(latitude: nil, longitude: nil)
  end
end
