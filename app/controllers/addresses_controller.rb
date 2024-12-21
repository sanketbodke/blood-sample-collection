class AddressesController < ApplicationController
  before_action :authenticate_user!

  def create
    @address = current_user.build_address(address_params)

    if @address.save
      redirect_to profile_path(current_user), notice: "Address Updated"
    else
      redirect_to profile_path(current_user), notice: "Failed to update address"
    end
  end

  def update
    @address = current_user.address

    if @address.update(address_params)
      redirect_to profile_path(current_user), notice: "Address Updated"
    else
      redirect_to profile_path(current_user), notice: "Failed to update address"
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end
end
