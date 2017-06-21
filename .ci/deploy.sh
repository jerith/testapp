#!/bin/sh

tag=$(cat image-params/tag)

cat > deploy-params/testapp.json <<EOF
{
  "id": "testapp",
  "instances": 1,
  "cpus": 0.5,
  "mem": 128,
  "disk": 0,
  "gpus": 0,
  "backoffSeconds": 1,
  "backoffFactor": 1.15,
  "maxLaunchDelaySeconds": 3600,
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "index.docker.io/jerithorg/testapp:${tag}",
      "network": "BRIDGE",
      "portMappings": [
        {
          "containerPort": 5858,
          "hostPort": 0,
          "protocol": "tcp",
          "name": "default"
        }
      ],
      "privileged": false,
      "forcePullImage": true
    }
  },
  "upgradeStrategy": {
    "minimumHealthCapacity": 1,
    "maximumOverCapacity": 1
  },
  "unreachableStrategy": {
    "inactiveAfterSeconds": 300,
    "expungeAfterSeconds": 600
  },
  "requirePorts": true,
  "labels": {
    "HAPROXY_GROUP": "external",
    "HAPROXY_0_VHOST": "testapp.qa-seed-hub.za.p16n.org"
  }
}
EOF
