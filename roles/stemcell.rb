name "stemcell"
description "Base role applied to all nodes."
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(%w(
  recipe[rackspace::hosts] 
  recipe[gentoo::feature_buildpkg]
  recipe[gentoo::feature_getbinpkg]
  recipe[gentoo::portage_binhost]
  recipe[gentoo::exclude_categories] 
  recipe[gentoo::portage_rsync]
  recipe[gentoo::chef_overlay]
  recipe[gentoo::eix]
  recipe[gentoo::cron_eix_sync]
))

# Attributes applied if the node doesn't have it set already.
#default_attributes()

# Attributes applied no matter what the node has set already.
override_attributes(
  :gentoo => {
    :rsync => {
      :uri => 'rsync://chef-server/gentoo-portage'
    },
    :portage_binhost => 'http://chef-server/'
  }
)
