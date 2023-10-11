#!/bin/bash
base_path="/home/grays/Documents/repos/old/hashistack-multi-tenant-infrastructure-mockup/simple-demo"
# kill any existing processes before starting
pkill -f nomad
pkill -f consul
pkill -f vault
sleep 5
pkill -f nomad
pkill -f consul
pkill -f vault
sleep 5
rm -rf ${base_path}/data/*