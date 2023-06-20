#
# Cookbook:: pg-pmm
# Recipe:: client
#
# Copyright:: 2023, The Authors, All Rights Reserved.
include_recipe "pg-pmm"

package "postgresql-client-#{node["postgresql"]["version"]}"