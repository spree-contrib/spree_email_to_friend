Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_email_to_friend'
  s.version     = '0.30.0.beta2'
  s.summary     = 'Spree extension to send product recommendations to friends'
  #s.description = 'Add (optional) gem description here'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Jorge Calás Lozano, Roman Smirnov'
  # s.email             = 'roman@railsdog.com'
  # s.homepage          = 'http://www.rubyonrails.org'
  # s.rubyforge_project = 'actionmailer'

  s.files        = Dir['CHANGELOG', 'README.md', 'LICENSE', 'lib/**/*', 'app/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  s.add_dependency('spree_core', '>= 0.30.0.beta2')
  s.add_dependency('spree_auth', '>= 0.30.0.beta2')
  s.add_dependency('recaptcha')
end
