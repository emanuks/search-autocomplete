#!/usr/bin/env bash
# exit on error
set -o errexit

rails stimulus:install
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean