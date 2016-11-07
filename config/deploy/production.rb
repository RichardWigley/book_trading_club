###################################################
#                  PRODUCTION                     #
###################################################
#
#-------------------------------------------------------------------------------
# Capistrano Standard environment settings
#
def server_name
  "#{fetch(:application)}.richardwigley.co.uk"
end

set :stage, :production
set :branch, 'master'

role :app, server_name
role :web, server_name
role :db,  server_name

server server_name, user: 'deployer', roles: %w(web app db), primary: true
set :rails_env, :production

#-------------------------------------------------------------------------------

#
# Puma / Nginx Config
#
set :nginx_server_name, "#{server_name} www.#{server_name}"
