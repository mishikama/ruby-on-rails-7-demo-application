#!/bin/bash
RAILS_ENV=development
bin/rails db:setup db:migrate
rails server -b 0.0.0.0