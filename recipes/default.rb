#
# Cookbook Name:: moodle
# Recipe:: default
#
# Copyright (C) 2015 Hikaru Mathieson
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'git'
include_recipe 'moodle::webserver'

# create moodle cache directory
directory "/var/cache/moodle" do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

# create moodle data directory
directory "/usr/local/moodledata" do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  action :create
end

# create document root
directory '/usr/share/nginx/www/moodle' do
  action :create
  owner 'www-data'
  group 'www-data'
  mode '0755'
  recursive true
end

# copy moodle source files from totara git
git "/usr/share/nginx/www/moodle" do
  repository "https://github.com/totara/moodle.git"
  reference "v2.7.1"
  action :sync
end

# copy config file to moodle root
cookbook_file "/usr/share/nginx/www/moodle/config.php" do
  source "config.php"
  mode "0755"
end





