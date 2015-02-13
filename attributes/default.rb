# Load settings from data bag 'r53/settings'
#
settings = Chef::DataBagItem.load('r53', 'settings')[node.chef_environment] rescue {}
Chef::Log.debug "Loaded settings: #{settings.inspect}"

# Initialize the node attributes with node attributes merged with data bag attributes
#
node.default[:r53] ||= {}
node.normal[:r53]  ||= {}

node.normal[:r53]    = DeepMerge.merge(node.default[:r53].to_hash, node.normal[:r53].to_hash)
node.normal[:r53]    = DeepMerge.merge(node.normal[:r53].to_hash, settings.to_hash)

node.default[:ip] = "public-ipv4" #Can be set to 'local-ipv4' to get the local ip
node.default[:ttl] = "60"
