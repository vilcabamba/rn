#!/usr/bin/bash
git fetch && git pull
RAILS_ENV=production
bundle exec rake assets:precompile
bundle exec rake db:migrate
touch tmp/restart.txt
