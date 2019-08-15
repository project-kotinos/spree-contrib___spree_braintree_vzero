#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
export CI=true
export TRAVIS=true
export CONTINUOUS_INTEGRATION=true
export USER=travis
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export RAILS_ENV=test
export RACK_ENV=test
export MERB_ENV=test
export JRUBY_OPTS="--server -Dcext.enabled=false -Xcompile.invokedynamic=false"

apt-get update && apt-get install -y tzdata mysql-server-5.7 mysql-client-core-5.7 mysql-client-5.7
gem install bundler -v 2.0.1
# install
bundle install --jobs=3 --retry=3
# script
bundle exec rake test_app
bundle exec rake spec
bundle exec codeclimate-test-reporter
