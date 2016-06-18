#!/bin/bash

bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rails s -b 0.0.0.0 -p 3000
