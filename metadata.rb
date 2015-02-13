name        "r53"
description "Update Route53 Zone"
maintainer  "Gilt groupe"
license     "Apache 2.0"
version     "1.1.0"

depends "route53"

provides 'r53::add'
provides 'r53::add_public_ip'
provides 'r53::add_public_host'
provides 'r53::add_private_ip'
provides 'r53::add_private_host'
