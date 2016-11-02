#!/bin/bash

export OS_USERNAME=admin
export OS_PASSWORD=123
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://$1:35357/v3
export OS_IDENTITY_API_VERSION=3

function create(){
  openstack user create --domain default --password $2 neutron
  openstack role add --project service --user neutron admin
  openstack service create --name neutron --description "OpenStack Networking" network
  openstack endpoint create --region RegionOne network public http://$1:9696
  openstack endpoint create --region RegionOne network internal http://$1:9696
  openstack endpoint create --region RegionOne network admin http://$1:9696
}
create $1 $2
