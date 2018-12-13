gem 'slim-rails', '~> 3.2.0'
gem 'devise', '~> 4.5.0'

gem_group :development, :test do
  gem 'rspec-rails', '~> 3.8.1'
  gem 'factory_bot_rails', '~> 4.11.1'
end

after_bundle do
  generate 'rspec:install'
  generate 'devise:install'
  generate 'devise user' if yes?('Generate devise for User model?')
  generate 'devise administrator' if yes?('Generate devise for Administrator model?')

  if yes?('Generate Home Controller?')
    generate :controller, 'home index'
    route "root to: 'home#index'"
  end

  rails_command 'db:create'
  rails_command 'db:migrate'

  environment "config.action_mailer.default_url_options = {host: 'localhost', port: 3000}", env: 'test'
  environment "config.action_mailer.default_url_options = {host: 'localhost', port: 3000}", env: 'development'
  environment "config.action_mailer.default_url_options = {host: 'www.example.com', port: 3000}", env: 'production'

  if yes?('Commit this installation?')
    git :init
    git add: '.'
    git commit: %Q{ -m 'Initial commit :sunglasses:' }
  end
end
