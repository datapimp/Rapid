source 'http://rubygems.org'

gem 'rails', '3.0.3'

#databases / backends
gem 'sqlite3-ruby', :require => "sqlite3"
gem 'mysql2'
gem 'redis'

#background jobs
gem 'resque'
gem 'resque-scheduler'

# state machine implementation
gem 'transitions'

#deployment tools
gem 'vlad'
gem 'vlad-git'

#styling / views / etc
gem 'haml'
gem 'compass'
gem 'jammit'
gem 'html5-boilerplate', ">= 0.2.6"
gem 'yui-compressor'
gem 'barista', '>= 0.5.0'

#image uploads
gem 'paperclip'

#authentication / authorization
gem 'devise'
gem 'cancan'
gem 'omniauth'

#web sockets
gem 'juggernaut'

group :development do
  gem 'haml-rails'
  gem 'hpricot', '0.8.2'
  gem 'ruby_parser', '2.0.5'
  gem 'rspec-rails', '>= 2.1.0'
  gem 'sprockets'
  gem 'annotate'
  gem 'spork', '>= 0.9.0.rc2'
  gem 'web-app-theme', '>= 0.6.2'
  gem 'interactive_editor'
end


# when deploying to a non mac environment
# need to do bundle --without development_mac
group :development_mac do
  gem "autotest-fsevent"
  gem "autotest-growl"
end


group :test do
  gem "factory_girl_rails"
  gem "autotest"
  gem "cucumber-rails"
  gem 'cucumber'
  gem "capybara"
  gem "shoulda"
  gem "database_cleaner"
  gem "test_notifier"
  gem 'rspec', '>= 2.1.0'
  gem 'launchy' 
end
