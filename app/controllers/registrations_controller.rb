class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :bio, :email, :password, :password_confirmation, {avatar_attributes: :attachment})
  end

  def account_update_params
    params.require(:user).permit(:username, :bio, :email, :password, :password_confirmation, :current_password, {avatar_attributes: :attachment})
  end
end