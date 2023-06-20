#------------------------------------------------------------------------------
# POSTGRES VERSION
#------------------------------------------------------------------------------

default["postgresql"]["version"]                         = "14"

#----------------------------------------------------------------------------
# DAEMON CONTROL
#----------------------------------------------------------------------------

default["postgresql"]["service_actions"]                 = %w[enable start]
default["postgresql"]["cfg_update_action"]               = :restart


#------------------------------------------------------------------------------
# APT REPOSITORY
#------------------------------------------------------------------------------

default["postgresql"]["apt_distribution"] = node["lsb"]["codename"]
default["postgresql"]["apt_repository"]   = "apt.postgresql.org"
default["postgresql"]["apt_uri"]          = "http://apt.postgresql.org/pub/repos/apt"
default["postgresql"]["apt_components"]   = ["main", node["postgresql"]["version"]]
default["postgresql"]["apt_key"]          = "https://www.postgresql.org/media/keys/ACCC4CF8.asc"
