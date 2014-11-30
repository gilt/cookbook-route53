require 'net/http'
include_recipe 'route53'

route53_record "create a record" do
  name  node[:opsworks][:instance][:hostname] + "." + node[:r53][:zone_name]
  value Net::HTTP.get(URI.parse("http://169.254.169.254/latest/meta-data/#{node[:r53][:ip]}"))
  type  "A"
  ttl   node[:r53][:ttl].to_i
  zone_id               node[:r53][:zone_id]
  overwrite true
  action :create
end
