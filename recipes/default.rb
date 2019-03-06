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

package "heartbeat" do
  action :upgrade
end


#
# Cookbook:: heartbeat
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
