require 'rubocop/rake_task'
require 'reek/rake/task'

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

# scss-lint removed from rake task
#   - intermittent bug cannot get a solid fix
#   - added scss-lint to pre-commit
# Bug
# ActionView::Template::Error: Illegal nesting: Only properties may be nested beneath
# properties. If I try and use scss-lint - even with require: false
# https://github.com/brigade/scss-lint/issues/496
# Replacing task 'rails full' with 'rails incomplete'

task full: [:'brakeman:run', :rubocop, :reek, :test]
