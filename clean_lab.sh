# make sure all consul, nomad, and vault processes are dead
#pkill -f nomad
#pkill -f consul
#pkill -f vault
#sleep 5
#
#pkill -f nomad
#pkill -f consul
#pkill -f vault
#sleep 5

# mac os delete ips
# sudo ifconfig lo0 delete 127.0.0.20
# linux delete ips
# sudo ip addr del 127.0.0.20/32 dev lo
# remove data path
# rm -rf ${base-path}/data
