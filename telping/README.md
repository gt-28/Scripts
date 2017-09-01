pingall bash script will check the status of multiple hosts by pinging and doing telnet to the respected ports of the URL.

Script takes the input from the Host-port.txt file where we specify 
'hostname:port' inside the file.

How to execute the script ::

cmd :: ./pingall.sh 

script then looks for the txt file to get the host and port numbers. 

sample Output :::


──╼ $./pingall.sh 
 > Status Of Host google.com = [ RUNNING ]
 > Status Of Host gmail.com = [ RUNNING ]
 > Status Of Host yahoo.com  = [ RUNNING ]
 > Status Of Host chef.io = [ RUNNING ]
 > Status Of Host 127.0.0.1 = [ RUNNING ]
Connection closed by foreign host.
 > Port 443 of URL http://google.com:443/ is [ OPEN ]
Connection closed by foreign host.
 > Port 443 of URL http://gmail.com:443/ is [ OPEN ]
Connection closed by foreign host.
 > Port 80 of URL http://yahoo.com :80/ is [ OPEN ]
Connection closed by foreign host.
 > Port 80 of URL http://chef.io:80/ is [ OPEN ]
telnet: connect to address 127.0.0.1: Connection refused
 > Port 80 of URL http://127.0.0.1:80/ is [ NOT OPEN ]


