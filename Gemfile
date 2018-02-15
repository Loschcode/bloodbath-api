source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# ruby '2.3.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Sidekiq management
gem 'sidekiq', '~> 5.0.5'
gem 'sidekiq-cron', '~> 0.6.3'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Redis
gem 'redis', '~> 3.0'

# Serializer for JSON output
gem 'active_model_serializers', '~> 0.9'

# Crypto following
gem 'cryptocompare', '~> 0.13.0'

# CRON Job
# NOTE : this is not working with Dokku
# gem 'whenever', '~> 0.10.0', :require => false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Bcrypt for encrypted passwords
gem 'bcrypt'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
