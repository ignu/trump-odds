require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "./lib/trump_odds"

RSpec::Core::RakeTask.new(:spec)

task :default do
  while true
    TrumpOdds.check
    sleep(60)
  end
end
