require 'bundler'
Bundler::GemHelper.install_tasks
require 'yourbase/rspec/skipper'
require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default do
  Rake::Task[:test_app].invoke
  Dir.chdir('../../')
  Rake::Task[:spec].invoke
end

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_braintree_vzero'
  Rake::Task['extension:test_app'].invoke
end
