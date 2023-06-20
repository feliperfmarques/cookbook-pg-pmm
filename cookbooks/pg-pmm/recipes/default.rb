#
# Cookbook:: pg-pmm
# Recipe:: default
#
# Copyright:: 2023, The Authors, All Rights Reserved.

# pin default package preferences
apt_preference "pgdg" do
  glob "*"
  pin "release o=apt.postgresql.org"
  pin_priority "750"
end

include_recipe "pg-pmm::apt_repository"
package "postgresql-common"  # install common files
