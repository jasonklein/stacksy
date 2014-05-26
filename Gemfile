source 'https://rubygems.org'

gem 'rails', '3.2.18'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Per Heroku: "[rails_12factor] enables serving assets in production and setting your logger to standard out,
# both of which are required to run a Rails 4 application on a twelve-factor provider.
# The gem also makes the appropriate changes for Rails 3 apps."

gem 'rails_12factor', group: :production

# Recommended by Heroku, to ensure requests do not tie up
# the application's dyno past the request timeout

gem 'rack-timeout'

gem 'devise'
gem 'omniauth-facebook'

gem 'haml-rails'
gem 'sunspot_rails'
gem 'ransack'
gem 'cancan'
gem 'geocoder'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets-rails', '=2.0.0.backport1'
  gem 'sprockets', '=2.2.2.backport2'
  gem 'sass-rails', github: 'guilleiguaran/sass-rails', branch: 'backport'
  # gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'


  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :development, :test do

  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'binding_of_caller'
  gem 'better_errors'

end
