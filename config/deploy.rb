# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'swipeyrank'
set :repo_url, 'https://github.com/RickCSong/swipey_rank.git'

set :deploy_to, "/app/#{fetch :application}"

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle}

set :rvm_type, :system
set :rvm_ruby_version, "2.1.2"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup', 'deploy:restart'
end
