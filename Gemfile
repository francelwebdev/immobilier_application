source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
# gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


#--------------------------#
#---------- MES GEMS ------#
#--------------------------#

gem 'bootsnap', '~> 1.3'

group :development do
  gem 'sqlite3'

  gem 'pry-rails', '~> 0.3.6'

  gem 'better_errors', '~> 2.4'
  gem 'binding_of_caller', '~> 0.8.0'
  gem 'pry-byebug', '~> 3.6'
  gem 'meta_request', '~> 0.5.0'
  gem 'hirb', '~> 0.7.3'

  #guard
  #
end

group :production do
  gem 'pg'
end

# Design
gem 'bootstrap', '~> 4.0'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'popper_js', '~> 1.12', '>= 1.12.9'
gem 'font-awesome-sass', '~> 5.0', '>= 5.0.6.2'

gem 'bootstrap-datepicker-rails', '~> 1.7', '>= 1.7.1.1'

# Static page
gem 'high_voltage', '~> 3.0'

# Design form and auth
gem 'simple_form', '~> 3.5', '>= 3.5.1'
gem 'devise', '~> 4.4', '>= 4.4.3'
gem 'devise-i18n', '~> 1.6'

gem 'jquery-slick-rails'


gem 'friendly_id', '~> 5.2', '>= 5.2.3'

# Pagination
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'bootstrap-kaminari-views', '~> 0.0.5'
gem 'kaminari-i18n', '~> 0.5.0'

# will paginate
# will paginate bootstrap


# secret keys
gem 'figaro', '~> 1.1', '>= 1.1.1'

# File upload
gem "mini_magick"
gem 'carrierwave'
gem 'cloudinary'
gem 'dropzonejs-rails'

gem 'gibbon', '~> 3.2'


gem 'autoprefixer-rails', '~> 8.0'

# Géolocalisation
gem 'geocoder', '~> 1.4', '>= 1.4.5'
gem 'gmaps4rails', '~> 2.1', '>= 2.1.2'


gem 'owlcarousel-rails', github: 'acrogenesis/owlcarousel-rails', branch: 'master'


# gem 'omniauth-facebook'


# a tester ce gem

gem 'bootstrap3-datetimepicker-rails', '~> 4.17', '>= 4.17.47'
gem 'jquery-datetimepicker', '~> 1.1'


# gem 'cancancan', '~> 2.1', '>= 2.1.3'
# gem 'pundit', '~> 1.1'

gem 'typedJS', '~> 0.0.2'

gem 'typedjs-rails', '~> 1.0', '>= 1.0.4'



gem 'sweetalert-rails', '~> 1.1', '>= 1.1.3'
gem 'sweet-alert-confirm', '~> 0.4.1'


gem 'magnific-popup-rails', '~> 1.1'
