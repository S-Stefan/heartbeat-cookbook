include_recipe "apt"

apt_update ("update") do
  action :update
end

remote_file "/tmp/heartbeat-5.2.2-amd64.deb" do
  source "https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-5.2.2-amd64.deb"
  action :create
end

dpkg_package "heartbeat" do
  source "/tmp/heartbeat-5.2.2-amd64.deb"
  action :install
end

template "/etc/heartbeat/heartbeat.yml" do
  source "heartbeat.yml.erb"
  notifies :restart, "service[heartbeat]"
end

service "heartbeat" do
  action :enable
end

bash "heartbeat_start" do
  code "sudo /etc/init.d/heartbeat start"
end




#
# Cookbook:: heartbeat
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
