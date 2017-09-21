#!/bin/bash

SetParam() {
export HOSTFILE="Hosts.txt"
export SHELL_LOG="`basename $0`.log"
}


Lookup_Hosts() {

SetParam
cat $HOSTFILE | while read host
do

nslookup $host 

done;
}

Main() {
Lookup_Hosts
}
SetParam
Main | tee -a $SHELL_LOG
