class Account::ReadersController < AccountController
  before_action :account_navigation

  def show

  end

  private

  def account_navigation
    if current_user.reader?
      @account_navigation = "reader"
    else
      redirect_to root_path
    end
  end
end
