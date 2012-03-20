#========================
#CONFIG
#========================
set :application, "mamtest"
 
set :scm, :git
set :git_enable_submodules, 1
set :repository, "git@github.com:mojojoseph/mamtest"
set :branch, "master"
set :ssh_options, { :forward_agent => true }
set :runner, "deploy"
#set :app_server, :passenger

#========================
#CUSTOM
#========================

task :staging do
  set :user, "jbell"
  set :use_sudo, false
  set :domain, "192.168.0.108"
  set :stage, :staging
  set :deploy_to, "~/web/apps/#{stage}/#{application}"
  role :app, domain
  role :web, domain
  role :db, domain, :primary => true
end

task :production do
  set :user, "root"
  set :use_sudo, false
  set :domain, "webserver1.iachieved.it"
  set :stage, :production
  set :deploy_to, "/web/apps/#{stage}/#{application}"
  role :app, domain
  role :web, domain
  role :db, domain, :primary => true
end

#ROLES
 
namespace :deploy do
  task :start, :roles => :app do
#    run "chown -R nobody #{current_release}"
#    run "touch #{current_release}/tmp/restart.txt"
  end
 
  task :stop, :roles => :app do
    # Do nothing.
  end
 
  desc "Restart Application"
  task :restart, :roles => :app do
#    run "chown -R nobody #{current_release}"
#    run "touch #{current_release}/tmp/restart.txt"
  end

  task :publish_ipa, :roles => :app do
    puts "Publish"
  end
end
