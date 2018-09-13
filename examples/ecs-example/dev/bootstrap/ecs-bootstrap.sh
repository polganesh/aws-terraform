#!/bin/bash

# update/install aws-cli ecs init etc to latest version
yum -y install aws-cli ecs-init nfs-utils awslogs jq


# echo ECS_CLUSTER=${cluster_name} >> /etc/ecs/ecs.config

# ECS Agent Configuration

echo "ECS_CLUSTER=${cluster_name}
ECS_ENGINE_AUTH_TYPE=docker
ECS_LOGLEVEL=warn
ECS_RESERVED_MEMORY=512
ECS_ENGINE_TASK_CLEANUP_WAIT_DURATION=5m
ECS_IMAGE_CLEANUP_INTERVAL=10m
ECS_IMAGE_MINIMUM_CLEANUP_AGE=30m" > /etc/ecs/ecs.config



# Docker Configuration
echo 'OPTIONS="$${OPTIONS} --storage-opt dm.basesize=${docker_storage_size}G"' >> /etc/sysconfig/docker
echo 'OPTIONS="$${OPTIONS} --storage-opt dm.basesize=10G"' >> /tmp/config.log

stop ecs
start ecs

# /etc/init.d/docker restart
# echo ECS_ENGINE_AUTH_TYPE=dockercfg >> /etc/ecs/ecs.config
# echo 'ECS_ENGINE_AUTH_DATA={"https://index.docker.io/v1/": { "auth": "${dockerhub_token}", "email": "${dockerhub_email}"}}' >> /etc/ecs/ecs.config

# Append addition user-data script
${additional_user_data_script}