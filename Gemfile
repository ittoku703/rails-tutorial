source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails',        '~> 6.1.3', '>= 6.1.3.2'
gem 'puma',         '~> 5.0'
gem 'sass-rails',   '>= 6'
gem 'webpacker',    '~> 5.0'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.7'
gem 'bootsnap',     '>= 1.4.4', require: false

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
