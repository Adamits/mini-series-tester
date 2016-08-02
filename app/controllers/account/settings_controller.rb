class Account::SettingsController < AccountController
  before_action :account_navigation

  def show

  end

  def make_reader
    if current_user.assign_role("Role::Reader")
      redirect_to account_settings_path
    else
      render :show
    end
  end

  def make_writer
    if current_user.assign_role("Role::Writer")
      redirect_to account_settings_path
    else
      render :show
    end
  end

  private

  def account_navigation
    @account_navigation = "settings"
  end
end
