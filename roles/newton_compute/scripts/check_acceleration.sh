#!/bin/bash

check=$(egrep -c '(vmx|svm)' /proc/cpuinfo)
if [ $check -eq 0 ]; then
  sed -i s/kvm/qemu/g /etc/nova/nova-compute.conf
fi
