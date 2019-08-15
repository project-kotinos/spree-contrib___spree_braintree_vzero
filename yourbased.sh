#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y tzdata mysql-server-5.6 mysql-client-core-5.6 mysql-client-5.6
gem install bundler -v 2.0.1
# install
bundle install --jobs=3 --retry=3
# script
bundle exec rake test_app
bundle exec rake spec
bundle exec codeclimate-test-reporter
