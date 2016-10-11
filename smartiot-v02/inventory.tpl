[all:vars]
# Environment: dev => enable repo-prod-testing or prd
env=qual

# Network to configure access in pg_hba
network=172.31.6.0

# Netmask to configure access in pg_hba
netmask=24

[historydb]
${historydb_host}

[catalogdb]
${catalogdb_host}

[inputqueue]
${inputqueue_host}

[deliveryqueue]
${deliveryqueue_host}

[listener]
${listener_host}

[processingworker]
${processingworker_host}

[deliveryworker]
${deliveryworker_host}

[retrydeliveryworker]
${retrydeliveryworker_host}

[configserver]
${configserver_host}

[logs]
${logs_host}

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

