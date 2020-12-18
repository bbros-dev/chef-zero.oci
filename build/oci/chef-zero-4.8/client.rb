node_name ENV['POLICY_NAME']

policy_name ENV['POLICY_NAME']
policy_group 'local'
policy_document_native_api true

checksum_path '/opt/chef-repo/checksums'
chef_server_url 'http://127.0.0.1:8889'
chef_license 'accept'
client_name ENV['POLICY_NAME']
cookbook_path '/opt/chef-repo/cookbooks'
data_bag_path '/opt/chef-repo/data_bags'
encrypted_data_bag_secret '/opt/chef-repo/data_bags/encrypted_data_bag_secret'
environment_path '/opt/chef-repo/environments'
file_backup_path '/opt/chef-repo/backup'
file_cache_path '/opt/chef-repo/cache'
log_level :debug
log_location '/var/log/chef-client.log'
nodes_path '/opt/chef-repo/nodes'
role_path '/opt/chef-repo/roles'
use_policyfile true
verify_api_cert false
versioned_cookbooks true
