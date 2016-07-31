#!/bin/bash
clear
echo "=================================================="
echo "Block ASNs script and set DNS for Android AFWall"
echo 
echo
echo
echo Python2 and python2-ipaddress are required !!
echo
echo "=================================================="
echo
echo
echo
echo
echo "--------------------------------------------------"
echo "Thx ukanth for the great AFWall app!" 
echo
echo "Visit https://github.com/ukanth/afwall"
echo
echo
echo "Script is based on infos and python scripts from Mike Kuketz. Thx!"
echo
echo "Visit https://www.kuketz-blog.de/"
echo "--------------------------------------------------"
echo
echo
read -n 1 -s -p "Press any key to continue"
clear
cp \script/default.list iptables_on.sh
echo "Set DNS Server? Press key [1-3]"
echo
echo
echo "[1] Don't change DNS Server"
echo "[2] 84.200.69.80 DNS Watch"
echo "[3] 91.239.100.100 Censurfridns Denmark"
echo
echo -n ":"
while read Option
do
case $Option in
1)
echo "Don't touch DNS Server"
break
;;
2)
echo "Setting DNS Watch"
echo "$""IPTABLES -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 84.200.69.80:53" >>iptables_on.sh
echo "$""IPTABLES -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 84.200.69.80:53" >> iptables_on.sh
break
;;
3)
echo "Setting Censurfridns Denmark"
echo "$""IPTABLES -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 91.239.100.100:53" >>iptables_on.sh
echo "$""IPTABLES -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 91.239.100.100:53" >> iptables_on.sh
break
esac
done
clear
echo "Block ASNs:"
echo
echo
echo
echo "Block Google? y/n"
echo
echo "Note: one exception will be added for Google IP 104.197.59.8"
echo "This is neccessary to get updates from https://download.cyanogenmod.org"
echo -n ":"
while read Option
do
case $Option in
y|Y)
echo Adding Google ASN to list
echo "$""IPTABLES -A "afwall" --destination "104.197.59.8" -j RETURN" >> iptables_on.sh
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS15169' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > google.txt
python2 \script/google.py >> iptables_on.sh
break
;;
n|N)
echo "Skipped Google"
break
;;
esac
done
clear
echo "Block Facebook? y/n"
echo -n ":"
while read Option
do
case $Option in
y|Y)
echo Adding Facebook ASN to list
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS32934' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > facebook.txt
python2 \script/facebook.py >> iptables_on.sh
break
;;
n|N)
echo "Skipped Facebook"
break
;;
esac
done
clear
echo "Block Samsung? y/n"
echo -n ":"
while read Option
do
case $Option in
y|Y)
echo Adding Samsung ASN to list
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS6619' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > samsung.txt
python2 \script/samsung.py >> iptables_on.sh
break
;;
n|N)
echo "Skipped Samsung"
break
;;
esac
done
clear
echo "Block Apple? y/n"
echo -n ":"
while read Option
do
case $Option in
y|Y)
echo Adding Apple ASN to list
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS714' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > apple.txt
python2 \script/apple.py >> iptables_on.sh
break
;;
n|N)
echo "Skipped Apple"
break
;;
esac
done
clear
#Amazon list is really big and right now not applyable by afwall on some devices
#echo "Block Amazon? y/n"
#echo -n ":"
#while read Option
#do
#case $Option in
#y|Y)
#echo Adding Amazon ASN to list
#curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS16509' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > amazon.txt
#python2 \script/amazon.py >> iptables2_on.sh
#break
#;;
#n|N)
#echo "Skipped Amazon"
#break
#;;
#esac
#done
clear
echo "Block Microsoft? y/n"
echo -n ":"
while read Option
do
case $Option in
y|Y)
echo Adding Microsoft ASN to list
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS8075' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > microsoft.txt
python2 \script/microsoft.py >> iptables2_on.sh
break
;;
n|N)
echo "Skipped Microsoft"
break
;;
esac
done
clear
rm microsoft.txt
rm amazon.txt
rm apple.txt
rm google.txt
rm samsung.txt
rm facebook.txt
cp \script/iptables_off.sh .
clear
echo "End of script..."
echo
echo
echo "All rules for afwall were written to iptables_on.sh and iptables2_on.sh"
echo
echo "Now copy iptables_on.sh, iptables2_on.sh and iptables_off.sh to your internal storage."
echo
echo "In AFWall press the three dots in the top right corner and select"
echo "Set custom script. Now enter your path to the iptables scripts"
echo ". /[path to your storage]/iptables_on.sh" 
echo ". /[path to your storage]/iptables2_on.sh"
echo
echo
echo "NOTE: iptables2_on.sh is only generated if you chose Microsoft and/or Amazon ASN."
echo
echo
echo "Do the same for custom shutdown script using iptables_off.sh"
echo ". /[path to your storage]/iptables_off.sh"
echo
echo "For example: . /sdcard/iptables_off.sh"
echo
echo "IMPORTANT: Don't forget the ". /" point-space-slash before path!!"
echo "##########################################################"
echo 
echo
echo "Disable IPv6 Support in AFWall preferences->User Interface"
echo "Only IPv4 is working right now"
echo
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "Have fun and enjoy a bit more privacy!"
echo
echo "https://github.com/mglinux/afwall_easy"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
