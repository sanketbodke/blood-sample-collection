class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      role = params[:user][:is_lab] == "1" ? :lab : :patient
      resource.add_role(role)

      sign_in(resource)

      redirect_to new_user_session_path, notice: "User registered successfully"
    else
      render :new
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_lab)
  end
end