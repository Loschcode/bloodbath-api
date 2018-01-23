class UserPortfolioHandler
  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def find
    user_portfolio
  end

  private

  def user_portfolio
    @user_portfolio ||= existing || fresh
  end

  def existing
    user.user_portfolio
  end

  def fresh
    UserPortfolio.create(user: user)
  end
end
