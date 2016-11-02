#!/bin/bash

export OS_USERNAME=admin
export OS_PASSWORD=123
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://$1:35357/v3
export OS_IDENTITY_API_VERSION=3

function create(){
  openstack project create --domain default --description "Service Project" service
  openstack project create --domain default --description "Demo Project" demo
  openstack user create --domain default --password demo demo
  openstack role create user
  openstack role add --project demo --user demo user
}
create
