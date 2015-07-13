#!/usr/bin/bash
git fetch
git pull --rebase origin master
export RAILS_ENV=production
bundle install --deployment
bundle exec rake db:migrate
bundle exec rake assets:precompile
touch tmp/restart.txt
