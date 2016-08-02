class Account::WritersController < AccountController
  before_action :account_navigation

  def show

  end

  private

  def account_navigation
    @account_navigation = "writers"
  end
end
