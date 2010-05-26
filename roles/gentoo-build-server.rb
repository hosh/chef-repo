name "gentoo-build-server"
description "All Your Bases Are Belong To Us"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(%w(
  recipe[gentoo::mirrorselect]
  recipe[monit]
  recipe[gentoo::portage_rsync_server]
  recipe[nginx]
  recipe[gentoo::portage_binhost_server]
))

# Attributes applied if the node doesn't have it set already.
#default_attributes()

# Attributes applied no matter what the node has set already.
override_attributes(
  :gentoo => {
    :cron => {
      :emerge => {
         :hour => '1'
      }
    },
    :rsyncd => {
       :hosts_allow => '10.128.1.0/24',
       :hosts_deny => '*'
    },
    :rsync => {
      :uri => '' # Use system default
    },
    :portage_binhost_server => {
      :ips => [ '10.128.1.55' ],
      :server_name => 'chef-server'
    },
  },
  :monit => {
    :mailservers => [ 'chef-server' ],
    :alert_mail_to => 'root@chef-server'
  }
)
