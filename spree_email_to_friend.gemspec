# encoding: utf-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_email_to_friend'
  s.version     = '1.1'
  s.summary     = 'Spree extension to send product recommendations to friends'
  s.homepage    = 'https://github.com/calas/spree-email-to-friend'
  s.required_ruby_version = '>= 1.8.7'

  s.author        = 'Jorge Calás Lozano, Roman Smirnov'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.30.1')
  s.add_dependency('spree_auth', '>= 0.30.1')
  s.add_dependency('recaptcha', '>= 0.3.1')
end
