# WIP(Work in Progress)

## Description

[Chef](https://www.chef.io/) cookbook for setup postgresql cluster + [Percona pmm](https://github.com/percona/pmm).

## Supported Platforms

This was tested on Linux Ubuntu 20.04(focal) x86_64 using [vagrant](https://www.vagrantup.com) with docker provider.

## Versions

- Chef Workstation version: 23.5.1040
- Test Kitchen version: 3.5.0
- Cookstyle version: 7.32.2
- Chef Infra Client version: 18.2.7
- Chef InSpec version: 5.21.29
- Chef CLI version: 5.6.11
- Chef Habitat version: 1.6.652

## Recipes

- `pg-pmm` - Setup the apt repository and install postgresql common packages
- `pg-pmm::apt_repository` - Setup the apt repository
- `pg-pmm::server` - Install postgresql server
- `pg-pmm::service` - Setup the system service
- `pg-pmm::client` - Install postgresql client
- `pg-pmm::setup_users` - Setup postgresql users (WIP)
- `pg-pmm::setup_primary` - Setup postgresql server for primary nodes (WIP)
- `pg-pmm::setup_standby` - Setup postgresql server for standby nodes (WIP)
- `pg-pmm::pmm` - Install Percona pmm (WIP)
- `pg-pmm::setup_pmm` - Setup Percona pmm (WIP)
