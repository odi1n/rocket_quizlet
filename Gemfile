source 'https://rubygems.org'

git_source(:github) do |repo_name|
    repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
    "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1.0'
gem 'rails-i18n'
gem 'pg', '>= 0.18', '< 2.0'
gem 'turbolinks' #required for redirects even if using via webpack

gem 'rocket_cms_activerecord'

gem 'glebtv-ckeditor'

# wait for https://github.com/sferik/rails_admin/pull/3207
gem 'rails_admin', github: "sferik/rails_admin"

gem 'slim'
gem 'slim-rails'


#gem 'sass'
#gem 'sass-rails'
gem 'rs-webpack-rails'

gem 'devise'
gem 'devise-i18n'
gem 'cancancan'

gem 'cloner'
gem 'puma'

gem 'shrine'

gem 'image_processing'

#gem 'uglifier'

#gem 'rs_russian'
gem 'enumerize'
gem 'active_model_serializers'

# windows
gem 'tzinfo-data' if Gem.win_platform?
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

gem 'bootsnap', require: false
gem 'irb'

# form
gem 'simple_form'


group :development do
    #gem 'binding_of_caller'
    #gem 'better_errors', github: 'charliesome/better_errors'
    gem 'pry-rails'
    gem 'listen'
    gem 'annotate'

    gem 'capistrano', require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano3-puma', require: false
    gem 'capistrano-rails', require: false
end

group :development, :test do
    gem "factory_bot_rails"
    gem 'rspec-rails'

    gem 'capybara'
    # https://github.com/mattheworiordan/capybara-screenshot/issues/243
    gem 'capybara-screenshot'
    gem 'selenium-webdriver'
    gem 'webdrivers'
    gem 'database_cleaner'

    #gem 'database_cleaner-redis'
    gem 'ffaker'
    gem 'timecop'
    gem "pry-rails"
    gem 'childprocess'
end

