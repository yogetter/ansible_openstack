#!/bin/bash

export OS_USERNAME=admin
export OS_PASSWORD=123
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://$1:35357/v3
export OS_IDENTITY_API_VERSION=3

wget http://download.cirros-cloud.net/0.3.4/cirros-0.3.4-x86_64-disk.img
function create(){
  openstack image create "cirros" --file cirros-0.3.4-x86_64-disk.img --disk-format qcow2 --container-format bare --public
}
create
