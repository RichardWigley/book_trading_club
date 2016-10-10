require 'rubocop/rake_task'
require 'reek/rake/task'
require 'scss_lint/rake_task'

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

SCSSLint::RakeTask.new do |t|
  t.files = Dir.glob(['app/assets/stylesheets/components.banner.scss'])
end

task full: [:scss_lint, :rubocop, :reek, :test]
