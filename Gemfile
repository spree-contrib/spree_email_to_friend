source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch
gem 'solidus_auth_devise', '~> 1.0'

gem 'pg'
gem 'mysql2'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'vcr'
  gem 'webmock'
  gem 'timecop'
end

gemspec