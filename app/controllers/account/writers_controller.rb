class Account::WritersController < AccountController
  before_action :account_navigation

  def show

  end

  private

  def account_navigation
    if current_user.writer?
      @account_navigation = "writers"
    else
      redirect_to root_path
    end
  end
end
