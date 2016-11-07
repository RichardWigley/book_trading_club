###################################################
#                  STAGING                        #
###################################################
#
#-------------------------------------------------------------------------------
# Capistrano Standard environment settings
#
def server_address
  'yell.richardwigley.co.uk'
end

set :stage, :production
set :branch, 'master'

role :app, server_address
role :web, server_address
role :db,  server_address

server server_address, user: 'deployer', roles: %w(web app db), primary: true
set :rails_env, :production

#-------------------------------------------------------------------------------

#
# Unicorn
#
set :nginx_server_name, server_address
