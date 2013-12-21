source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'unicorn'

group :development do
  gem "capistrano", "~> 2.15.0"
  gem "rvm-capistrano", :require => false
  gem 'capistrano-unicorn', :require => false
end


# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'pry-debugger'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'capybara'
  gem 'faker'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'guard-rspec'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'zurb-foundation', '~> 4.0.0'
gem 'simple_form', '~> 3.0.0.rc'
gem 'sass-rails', '~> 4.0.0.rc2'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'devise'
gem 'factory_girl_rails'
gem 'cancan'
gem 'rolify', "~> 3.2.0"
