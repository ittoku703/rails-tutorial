source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails',                      '~> 6.1.3', '>= 6.1.3.2'
gem 'aws-sdk-s3',                 '~> 1.96', '>= 1.96.1', require: false
gem 'image_processing',           '~> 1.12', '>= 1.12.1'
gem 'mini_magick',                '~> 4.11'
gem 'active_storage_validations', '~> 0.9.5'
gem 'bcrypt',                     '~> 3.1',   '>= 3.1.16'
gem 'faker',                      '~> 2.18'
gem 'will_paginate',              '~> 3.3'
gem 'bootstrap-will_paginate',    '~> 1.0'
gem 'bootstrap-sass',             '~> 3.4',   '>= 3.4.1'
gem 'puma',                       '~> 5.0'
gem 'sass-rails',                 '>= 6'
gem 'webpacker',                  '~> 5.0'
gem 'turbolinks',                 '~> 5'
gem 'jbuilder',                   '~> 2.7'
gem 'bootsnap',                   '>= 1.4.4', require: false

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console',        '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen',             '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'minitest',                 '~> 5.14', '>= 5.14.4'
  gem 'minitest-reporters',       '~> 1.4', '>= 1.4.3'
  gem 'guard',                    '~> 2.17'
  gem 'guard-minitest',           '~> 2.4', '>= 2.4.6'
  gem 'rexml',                    '~> 3.2', '>= 3.2.5'
end

group :production do
  gem 'pg', '~> 1.2', '>= 1.2.3'
end
