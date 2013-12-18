# Multistage
require 'capistrano/ext/multistage'
# Load bundler-capistrano gem
require "bundler/capistrano"
# Load rvm-capistrano gem
require "rvm/capistrano"
# Multistage
require 'capistrano/ext/multistage'

# Environments
set :stages, ["staging"]
set :default_stage, "staging"

set :ssh_options, {:forward_agent => true}
set(:app_title) { "hydra-nyu" }
set(:application) { "#{app_title}_repos" }

# RVM  vars
set :rvm_ruby_string, "2.0.0-p353"
set :rvm_type, :user

# Git vars
set :repository, "git@github.com:NYULibraries/hydra-nyu.git" 
set :scm, :git
set :deploy_via, :checkout
set(:branch, 'master') unless exists?(:branch)
set :git_enable_submodules, 1

set :keep_releases, 5
set :use_sudo, false

set :app_path, ENV["APP_PATH"]
set(:deploy_to) { "#{app_path}#{application}" }

namespace :deploy do
  task :create_symlink do
    run "rm -rf #{app_path}#{app_title} && ln -s #{current_path} #{app_path}#{app_title}"
  end
  task :create_current_path_symlink do
    run "rm -rf #{current_path} && ln -s #{current_release} #{current_path}"
  end
end

before "deploy", "rvm:install_ruby"
after "deploy", "deploy:create_symlink", "deploy:create_current_path_symlink", "deploy:cleanup"