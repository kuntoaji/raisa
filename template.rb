gem 'slim-rails'
gem 'devise'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

after_bundle do
  generate 'rspec:install'
  generate 'devise:install'
  generate 'devise administrator' if yes?('Generate devise for Administrator model?')

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
