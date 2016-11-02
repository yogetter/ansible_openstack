#!/bin/bash

export OS_USERNAME=admin
export OS_PASSWORD=$3
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://$1:35357/v3
export OS_IDENTITY_API_VERSION=3

function create(){
  openstack user create --domain default --password $2 nova
  openstack role add --project service --user nova admin
  openstack service create --name nova --description "OpenStack Compute" compute
  openstack endpoint create --region RegionOne compute public http://$1:8774/v2.1/%\(tenant_id\)s
  openstack endpoint create --region RegionOne compute internal http://$1:8774/v2.1/%\(tenant_id\)s
  openstack endpoint create --region RegionOne compute admin http://$1:8774/v2.1/%\(tenant_id\)s
}
create $1 $2
