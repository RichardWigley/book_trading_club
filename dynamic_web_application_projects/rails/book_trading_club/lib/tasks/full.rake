require 'rubocop/rake_task'
require 'reek/rake/task'
require 'scss_lint/rake_task'
RuboCop::RakeTask.new
Reek::Rake::Task.new
SCSSLint::RakeTask.new

task full: [:scss_lint, :rubocop, :reek, :test]
