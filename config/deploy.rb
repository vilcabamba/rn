# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'rueda-negocios'
set :repo_url, 'git@github.com:vilcabamba/rn.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, ENV["BRANCH"] || "master"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/macool/rdn'

set :rbenv_type, :user
set :rbenv_ruby, -> { File.read('.ruby-version').strip }

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'vendor/bundle',
  'public/system',
  'public/uploads'
)

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml',
  '.env'
)

# Default value for default_env is {}
# set :default_env, { }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :slack_webhook, "https://hooks.slack.com/services/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"

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute "mkdir -p #{release_path.join('tmp')}"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  desc 'Warm up the application by pinging it, so enduser wont have to wait'
  task :ping do
    on roles(:app), in: :sequence, wait: 5 do
      execute "curl -s -D - #{fetch(:host)} -o /dev/null"
    end
  end

  after :restart, :ping

  # ....
  # @example
  #   bundle exec cap production deploy:invoke task=users:update_defaults
  desc 'Invoke rake task on the server'
  task :invoke do
    fail 'no task provided' unless ENV['task']

    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, ENV['task']
        end
      end
    end
  end

end
