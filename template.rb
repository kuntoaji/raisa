gem 'slim-rails'
gem 'bourbon'
gem 'neat'
gem 'bitters'
gem 'devise'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

run 'rm app/assets/stylesheets/application.css'

file 'app/assets/stylesheets/application.scss', <<-CODE
  @import "bourbon";
  @import "base/base";
  @import "neat";
CODE

after_bundle do
  generate 'rspec:install'
  generate 'devise:install'
  generate 'devise admin' if yes?('Generate devise for Admin model?')

  generate :controller, 'home index'
  route "root to: 'home#index'"

  rails_command 'db:create'
  rails_command 'db:migrate'

  environment "config.action_mailer.default_url_options = {host: 'localhost', port: 3000}", env: 'test'
  environment "config.action_mailer.default_url_options = {host: 'localhost', port: 3000}", env: 'development'
  environment "config.action_mailer.default_url_options = {host: 'www.example.com', port: 3000}", env: 'production'

  git :init
  git add: '.'
  git commit: %Q{ -m 'Initial commit :sunglasses:' }
end
