#!/usr/bin/bash
git fetch
git pull --rebase origin master
RAILS_ENV=production
bundle exec rake assets:precompile
bundle exec rake db:migrate
touch tmp/restart.txt
