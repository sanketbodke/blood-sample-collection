class LabsController < ApplicationController
  before_action :authenticate_user!

  def create
    @lab = current_user.build_lab(lab_params)

    if @lab.save
      redirect_to profile_path(current_user), notice: "Lab created"
    else
      redirect_to profile_path(current_user), notice: "Failed to create lab"
    end
  end

  def update
    @lab = current_user.lab

    if @lab.update(lab_params)
      redirect_to profile_path(current_user), notice: "Lab updated"
    else
      redirect_to profile_path(current_user), notice: "Failed to update"
    end
  end

  private

  def lab_params
    params.require(:lab).permit(:name, :email, :phone)
  end
end
