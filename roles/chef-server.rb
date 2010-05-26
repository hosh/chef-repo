name "chef-server"
description "All Your Bases Are Belong To Us"
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(%w(
  recipe[couchdb::monit_server]
  recipe[chef::monit_solr]
  recipe[chef::monit_solr_indexer]
  recipe[chef::monit_server]
  recipe[chef::monit_server_webui]
))

# Attributes applied if the node doesn't have it set already.
#default_attributes()

# Attributes applied no matter what the node has set already.
override_attributes(
  :monit => {
    :mailservers => [ 'chef-server' ],
    :alert_mail_to => 'root@chef-server'
  },
  :ghetoo_dns => {
    :private_aliases => %w(chef-server)
  }
)
