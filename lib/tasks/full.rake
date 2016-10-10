require 'rubocop/rake_task'
require 'reek/rake/task'
require 'scss_lint/rake_task'

SCSSLint::RakeTask.new do |t|
  t.files = Dir.glob(['app/assets/stylesheets/*.scss'])
end

files = FileList['Gemfile',
                 'Rakefile',
                 'app/**/*.rb',
                 'config/**/*.rb',
                 'lib/**/*.rb',
                 'test/**/*.rb']

RuboCop::RakeTask.new do |t|
  t.patterns = files
end

Reek::Rake::Task.new do |t|
  t.config_file = './.reek'
  t.source_files = files
end

tasks = [:rubocop, :reek, :test]
task incomplete: tasks
task full: [:scss_lint] + tasks
