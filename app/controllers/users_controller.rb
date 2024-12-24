class UsersController < ApplicationController
  def profile
    @user = current_user
  end
  def update
    @user = current_user

    if @user.update(user_params)
      if @user.has_role?(:lab)
        @user.create_lab(name: params[:user][:lab_name], email: params[:user][:lab_email], phone: params[:user][:lab_phone])
      end
      redirect_to profile_path(@user), notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    if current_user.has_role?(:lab)
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :lab_name, :lab_email, :lab_phone,
                                   address_attributes: [ :id, :street, :city, :state, :zip ])
    else
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :dob, :gender, :blood_group,
                                   address_attributes: [ :id, :street, :city, :state, :zip ])
    end
  end
end
