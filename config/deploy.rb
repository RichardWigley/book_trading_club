#
#
# Configuration File to Deploy Schedule Gardener
#
#   - Supplies general variables that Capistrano uses to deploy software
#   - Other files supply environment specific settings:
#       -  /config/deploy/production.rb
#          /config/deploy/staging.rb
#
#
#-------------------------------------------------------------------------------
#
# Capistrano Standard Application
#
lock '3.5.0'

set :application, 'roe'
set :user, 'deployer'

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:full_app_name)}"

set :keep_releases, 3

# ruby-gems outside of vendored gem directory - bundler & rake (good practice?)
set :system_ruby, '~/.gem/ruby/2.3.0'

# required when Capistrano uses system ruby - bundle install
set :default_env, 'PATH' => "PATH=$PATH:#{fetch(:system_ruby)}/bin"

#
# SCM
#
set :scm, :git
set :repo_url, 'git@github.com:RichardWigley/book_trading_club.git'
set :branch, ENV['REVISION'] || ENV['BRANCH_NAME']

#-------------------------------------------------------------------------------

#
# db-tasks (and assets) - sgruhier/capistrano-db-tasks
#
set :db_local_clean, true      # remove the local dump file after loading
set :db_remote_clean, true     # rm the dump file from the server after download

set :assets_dir, %w(public/assets public/att)
set :local_assets_dir, %w(public/assets public/att)

set :default_env, 'PATH' => '$PATH:/home/deployer/.gem/ruby/2.3.0/bin'
