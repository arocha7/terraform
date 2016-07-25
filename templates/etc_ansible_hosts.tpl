[all:vars]
# Environment: dev => enable repo-prod-testing or prd
env=prd

# Network to configure access in pg_hba
network=10.112.0.0

# Netmask to configure access in pg_hba
netmask=16


[historydb]
historydb

[catalogdb]
catalogdb

[inputqueue]
inputqueue

[deliveryqueue]
deliveryqueue

[listener]
listener

[processingworker]
processingworker

[deliveryworker]
deliveryworker

[retrydeliveryworker]
retrydeliveryworker

[configserver]
configserver

[logs]
logs

[${env}:children]
historydb
catalogdb
inputqueue
deliveryqueue
listener
processingworker
deliveryworker
retrydeliveryworker
configserver
logs
