#!/bin/bash

export OS_USERNAME=admin
export OS_PASSWORD=$3
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://$1:35357/v3
export OS_IDENTITY_API_VERSION=3

function create(){
  openstack user create --domain default --password $2 glance
  openstack role add --project service --user glance admin
  openstack service create --name glance --description "OpenStack Image" image
  openstack endpoint create --region RegionOne image public http://$1:9292
  openstack endpoint create --region RegionOne image internal http://$1:9292
  openstack endpoint create --region RegionOne image admin http://$1:9292
}
create $1 $2
