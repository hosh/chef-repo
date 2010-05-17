name "test_recipes"
description "Drop recipes in here for testing."
# List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
run_list(%w(
))

# Attributes applied if the node doesn't have it set already.
#default_attributes()
# Attributes applied no matter what the node has set already.
override_attributes(
  :monit => {
    :mailservers => [ 'chef-server' ],
    :alert_mail_to => 'root@chef-server'
  },
  :rackspace => {
    :hosts => {
      :private_net => '172.*'
    }, 
    :private_aliases => %w( test-node template )
  }
)
