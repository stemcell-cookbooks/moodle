#
# Cookbook Name:: moodle
# Recipe:: webserver
#
# Copyright (C) 2015 Hikaru Mathieson
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt'
include_recipe 'nginx'

# install php packages required with moodle

package ['php5-fpm', 'php5-pgsql', 'php5-curl', 'php5-gd', 'php5-xmlrpc', 'php5-Intl', 'php-apc'] do
  action :install
  notifies :reload, 'service[php5-fpm]'
  notifies :reload, 'service[nginx]'
end

# define php5-fpm service

service 'php5-fpm' do
  supports :restart => true
  action [ :enable, :start ]
end

# disable default site
nginx_site 'default' do
  enable false
end

# create nginx config
template "#{node.nginx.dir}/sites-available/moodle" do
  source "moodle.erb"
  notifies :reload, 'service[nginx]'
end

# enable site
nginx_site "moodle" do
  enable true
  notifies :reload, 'service[nginx]'
end
