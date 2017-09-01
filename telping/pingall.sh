#!/bin/bash
#bash script to check ping and telnet status.

SetParam() {
export URLFILE="Host-Port.txt"
export port=80
export STATUS_UP=`echo -e "\E[32m[ RUNNING ]\E[0m"`
export STATUS_DOWN=`echo -e "\E[31m[ DOWN ]\E[0m"`
export SHELL_LOG="`basename $0`.log"
}

Ping_Hosts() {

SetParam
cat $URLFILE | while read host
do

server=`echo $host | cut -d : -f1`

ping -i 2 -c 6 $server > /dev/null 2>&1

if [ $? -eq 0 ] ; then
echo " > Status Of Host $server = $STATUS_UP";
else
echo " > Status Of Host $server = $STATUS_DOWN";
fi
done;
}

Telnet_Status() {

SetParam

cat $URLFILE | while read host
do

server=`echo $host | cut -d : -f1`
port=`echo $host | awk -F":" '{print $2}'`

TELNETCOUNT=`sleep 5 | telnet $server $port | grep -v "Connection refused" | grep "Connected to" | grep -v grep | wc -l`

if [ $TELNETCOUNT -eq 1 ] ; then

echo -e " > Port $port of URL http://$server:$port/ is \E[32m[ OPEN ]\E[0m";
else
echo -e " > Port $port of URL http://$server:$port/ is \E[32m[ NOT OPEN ]\E[0m";

fi
done;
}
Main() {
Ping_Hosts
Telnet_Status
}
SetParam
Main | tee -a $SHELL_LOG
