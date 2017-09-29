source 'https://rubygems.org'
ruby '2.4.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use postgres as the database for Active Record
gem 'pg'
gem 'pg_search'
# Use Puma as the app server
gem 'puma'
# Boostrap CSS
gem 'bootstrap-sass'
# User Font Awesome Icon set
gem 'font-awesome-rails'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use HAML for views
gem 'haml-rails'
# Pagination
gem 'kaminari'
gem 'bootstrap-kaminari-views'
# Markdown Parser
gem 'redcarpet'
gem 'rouge'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Settings file to config Site setup
gem 'config'
gem 'safe_yaml'

# Attachment Management
gem 'paperclip'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'rubocop'
end

group :production do
  # Herodu Integration
  gem 'rails_12factor'
end

group :test do
  gem 'rails-controller-testing'
  gem 'minitest-reporters'
  gem 'guard'
  gem 'guard-minitest'
  gem 'factory_girl_rails'
  gem 'shoulda'
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
