# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_email_to_friend/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_email_to_friend'
  s.version     = SpreeEmailToFriend.version
  s.summary     = 'Spree extension to send product recommendations to friends'
  s.description = s.summary
  s.required_ruby_version = '>= 2.2.5'

  s.authors      = ['Jorge Calás Lozano', 'Roman Smirnov', 'Trung Lê']
  s.homepage     = 'https://github.com/spree-contrib/spree_email_to_friend'
  s.license      = 'BSD-3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_path  = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_dependency 'spree_core', '~> 3.2.0.beta1'
  s.add_dependency 'recaptcha', '>= 0.3.1'

  s.add_development_dependency 'rspec-rails', '~> 3.5.2'
  s.add_development_dependency 'sqlite3', '~> 1.3.10'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'capybara', '~> 2.4.4'
  s.add_development_dependency 'poltergeist', '~> 1.6.0'
  s.add_development_dependency 'shoulda-matchers', '~> 2.8'
  s.add_development_dependency 'email_spec', '>= 1.6.0'
  s.add_development_dependency 'simplecov', '~> 0.8.2'
  s.add_development_dependency 'database_cleaner', '~> 1.4.0'
  s.add_development_dependency 'coffee-rails', '~> 4.2.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0'
  s.add_development_dependency 'ffaker', '>= 1.32.0'
  s.add_development_dependency 'guard-rspec', '>= 4.3.1'
  s.add_development_dependency 'pry-rails', '>= 0.3.2'
  s.add_development_dependency 'rubocop', '>= 0.24.1'
  s.add_development_dependency 'rabl', '= 0.13.0'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0.1'
end
