#!/bin/bash

OUTPUT=$HOME/sys_info.txt
IP=$(ip addr | head -9 | tail -1)
SUID=$(sudo find / type -f -perm /4000 2> /dev/null)


#check for the research4 dir
if [! -d /$HOME/research5 ]
then
        echo "The research5 does not exist"
else
        echo "making research5 dir"
        mkdir ~/research5
fi


#check that research4 has sys_info.txt
if [! -f $OUTPUT ]
then
        rm $OUTPUT
fi

echo "A Quick System Audit" >> $OUTPUT
echo >> $OUTPUT
echo "Title and date" >> $OUTPUT
date >> $OUTPUT
echo -e "\nMachine info" >> $OUTPUT
echo $MACHTYPE >> $OUTPUT
echo -e "Uname info $(uname -a) \n" >> $OUTPUT
echo -e "IP Info: $IP \n" >> $OUTPUT
echo "Hostname: $HOSTNAME" >> $OUTPUT
echo "DNS Servers: " >> $OUTPUT
cat /etc/resolv.conf >> $OUTPUT
echo "Memory Info: " >> $OUTPUT
free -h >> $OUTPUT
echo -e "\nCPU Info: " >> $OUTPUT
lscpu | grep CPU >> $OUTPUT
echo -e "\nDisk Usage: " >> $OUTPUT
df -H | head -2 >> $OUTPUT
echo -e "\nWho is logged in: \n $(who) \n" >> $OUTPUT
echo >> $OUTPUT
echo "New Stuff Below" >> $OUTPUT
echo >> $OUTPUT
#mkdir ~/research5
suid >> $OUTPUT
$SUID >> $OUTPUT
ps aux --sort -%m | awk '{$1, $2, $3, $4, $11}' | head >> $OUTPUT

