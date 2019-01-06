# Raisa

Raisa is a Rails 5 Application Template. This template will install all Ruby gems as described below and generate HomeController as root path.

## Example
Because this template will install rspec, you can pass `-T` option to prevent rails to generate test directory

```
rails new blog -m /home/example/raisa/template.rb -d postgresql -T
rails new blog -m http://example.com/raisa/template.rb -d postgresql -T
rails new blog -m https://raw.githubusercontent.com/kuntoaji/raisa/master/template.rb -d postgresql -T
```

## Gems
* Template - Slim
* Authentication - Devise
* Testing - Rspec, FactoryBot

## License
Raisa is released under the [MIT License](https://opensource.org/licenses/MIT).
