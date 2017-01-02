gem "slim-rails"
gem "bourbon"
gem "neat"
gem "bitters"

run "rm app/assets/stylesheets/application.css"

inside('app/assets/stylesheets') do
  run "touch aplication.scss"
end

file 'app/assets/stylesheets/application.scss', <<-CODE
  @import "bourbon";
  @import "base/base";
  @import "neat";
CODE

after_bundle do
  generate :model, "admin email:string name:string"
  generate :controller, "home index"
  route "root to: 'home#index'"
  rails_command "db:create"
  rails_command "db:migrate"
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit :sunglasses:' }
end
