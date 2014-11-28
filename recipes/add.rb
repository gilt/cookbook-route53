require 'net/http'
include_recipe 'route53'

route53_record "create a record" do
  name  node[:opsworks][:instance][:hostname] + '.example.com'
  value Net::HTTP.get(URI.parse('http://169.254.169.254/latest/meta-data/public-ipv4'))
  type  "A"
  ttl   60
  zone_id               node[:route53][:zoneId]
  overwrite true
  action :create
end
