# Policyfile_base - Base file to be evaluated by other Policyfiles
# Don't use it as a standalone Policyfile, it doesn't work.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

# A name that describes what the system you're building with Chef does.
name 'test'

# Where to find external cookbooks:
default_source :supermarket

# Specify a custom source for a single cookbook:
cookbook 'test', path: './'

# run_list: chef-client will run these recipes in the order specified.
run_list 'test::default'

# named_run_lists
named_run_list 'sftp', 'test::default'
named_run_list 'ssh', 'test::search'
