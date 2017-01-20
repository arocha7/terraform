[all:vars]
# Environment: 2 stage platform
env=qual

# Network to configure access
network=172.31.6.0

# Netmask to configure access
netmask=24

[web]
${web_host}

[db]
${db_host}

[kube:children]
web
db
