namespace :loschcode do
  desc "it will call the API to get the latest coins available on the market and insert them on the database"
  task refresh_market_coins: :environment do
    Tasks::Loschcode::RefreshMarketCoins.new.perform
  end
end
