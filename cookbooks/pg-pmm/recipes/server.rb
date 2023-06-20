#
# Cookbook:: .
# Recipe:: server
#
# Copyright:: 2023, The Authors, All Rights Reserved.
include_recipe "pg-pmm"

# don't auto-start the service to allow custom configuration
file "/usr/sbin/policy-rc.d" do
  mode "0755"
  content("#!/bin/sh\nexit 101\n")
  not_if "pgrep postgres"
end

# install the package
package "postgresql-#{node["postgresql"]["version"]}"
