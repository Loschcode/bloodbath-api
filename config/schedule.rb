# Learn more: http://github.com/javan/whenever
# set :output, 'log/cron.log'

#
# # We are currently in UTC time
# every :hour do
#   command 'The system has launched the rake task `cron:cron_name`'
#   rake 'cron:cron_name'
# end

# - refresh all the on going order trackings from the API
# every 1.day, :at => '11:00 am' do
#   command 'The system has launched the rake task `rake cron:refresh_trackings`'
#   rake 'cron:refresh_trackings'
# end
#

#
# # - remove all the empty carts from the database
# every :day do
#   command 'The system has launched the rake task `rake cron:remove_empty_carts`'
#   rake 'cron:remove_empty_carts'
# end

# the useless stuff is here
every 1.week do
  command 'The system has launched the rake task `rake cron:refresh_cryspibois`'
  rake 'cron:refresh_cryspibois'
end


# we check all the coins listed are up to date and add the ones which aren't
every 1.day do
  command 'The system has launched the rake task `rake cron:refresh_market_coins`'
  rake 'cron:refresh_market_coins'
end

# we check all the base currencies and refresh the exchange rate
every 1.hour do
  command 'The system has launched the rake task `rake cron:refresh_base_currencies`'
  rake 'cron:refresh_base_currencies'
end

# we check all the coins listed are up to date and add the ones which aren't
every 1.minute do
  command 'The system has launched the rake task `rake cron:broadcast_market_coins`'
  rake 'cron:broadcast_market_coins'
end
