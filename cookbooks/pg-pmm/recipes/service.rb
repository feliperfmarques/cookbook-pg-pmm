#
# Cookbook:: pg-pmm
# Recipe:: service
#
# Copyright:: 2023, The Authors, All Rights Reserved.

file "/usr/sbin/policy-rc.d" do
  action :delete
end

# define the service
service "postgresql" do
  supports reload: true, restart: true, status: true
  action Array(node["postgresql"]["service_actions"]).map(&:to_sym)
end