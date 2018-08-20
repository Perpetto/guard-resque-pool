require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

namespace :spec do
  desc "Run all specs on multiple ruby versions (requires rvm)"
  task :portability do
    system "bash -c 'bundle exec rake spec'"
  end
end
