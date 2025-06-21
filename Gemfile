source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "propshaft"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "devise"
gem "thruster", require: false
gem "image_processing"

gem "pg" # ← ここを全環境で使うように移動

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "rails-controller-testing"
  # gem "mysql2" は削除 or コメントアウト
end

group :development do
  gem "web-console"
  gem "dotenv-rails"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end

group :production do
  # pgはここから外して全環境で使うので空でOK
end
