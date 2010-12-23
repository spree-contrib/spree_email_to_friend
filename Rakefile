require 'rubygems'
require 'rake'
require 'rake/testtask'

desc "Default Task"
task :default => [ :spec ]

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

require 'cucumber/rake/task'
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

desc "Regenerates a rails 3 app for testing"
task :test_app do
  SPREE_PATH = ENV['SPREE_PATH']
  raise "SPREE_PATH should be specified" unless SPREE_PATH
  require File.join(SPREE_PATH, 'lib/generators/spree/test_app_generator')
  class AuthTestAppGenerator < Spree::Generators::TestAppGenerator
    def tweak_gemfile
      append_file 'Gemfile' do
<<-gems
gem 'spree_core', :path => '#{File.join(SPREE_PATH, 'core')}'
gem 'spree_auth', :path => '#{File.join(SPREE_PATH, 'auth')}'
gem 'spree_email_to_friend', :path => '#{File.dirname(__FILE__)}'
gems
      end
    end

    def install_gems
      system("cd spec/test_app && rake spree_core:install")
      system("cd spec/test_app && rake spree_auth:install")
    end

    def migrate_db
      run_migrations
    end
  end
  AuthTestAppGenerator.start
end

namespace :test_app do
  desc 'Rebuild test and cucumber databases'
  task :rebuild_dbs do
    system("cd spec/test_app && rake db:drop db:migrate RAILS_ENV=test && rake db:drop db:migrate RAILS_ENV=cucumber")
  end
end
