#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'
require 'kitchen'
require 'chef-dk/cli'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any']
    }
  end
end

desc 'Run all style checks'
task style: ['style:chef', 'style:ruby']

# Rspec and ChefSpec
desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end
end

namespace :policyfile do
  desc 'Run "chef update" for Policyfile.rb'
  task :update do
    Dir.glob('test/fixtures/cookbooks/test/Policyfile.rb').each do |file|
      cli = ChefDK::CLI.new(['update', file])
      subcommand_name, *subcommand_params = cli.argv
      subcommand = cli.instantiate_subcommand(subcommand_name)
      subcommand.run_with_default_options(subcommand_params)
    end
  end
end

# Default
task default: ['style', 'spec', 'policyfile:update', 'integration:vagrant']
