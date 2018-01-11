namespace :loschcode do
  desc "it will call the API to get the latest currencies available on the market and insert them on the database"
  task refresh_currencies_list: :environment do
    Tasks::Loschcode::RefreshCurrenciesList.new.perform
  end
end
