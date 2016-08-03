#!/bin/bash
clear
echo "=================================================="
echo "Block ASNs script and set DNS for Android AFWall"
echo 
echo
echo
echo "Python2 and python2-ipaddress are required !!"
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
mkdir ./afwscripts
cp \script/default.list  ./afwscripts/aafwall.sh
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
echo "$""IPTABLES -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 84.200.69.80:53" >> ./afwscripts/aafwall.sh
echo "$""IPTABLES -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 84.200.69.80:53" >> ./afwscripts/aafwall.sh
break
;;
3)
echo "Setting Censurfridns Denmark"
echo "$""IPTABLES -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 91.239.100.100:53" >>  ./afwscripts/aafwall.sh
echo "$""IPTABLES -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 91.239.100.100:53" >> ./afwscripts/aafwall.sh
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
echo "$""IPTABLES -A "afwall" --destination "104.197.59.8" -j RETURN" >>  ./afwscripts/aafwall.sh
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS15169' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > google.txt
python2 \script/google.py >>  ./afwscripts/google
split -a 1 -d -l 100 ./afwscripts/google ./afwscripts/google
rm ./afwscripts/google
break
;;
n|N)
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
python2 \script/facebook.py >>  ./afwscripts/facebook
split -a 1 -d -l 100 ./afwscripts/facebook ./afwscripts/facebook
rm ./afwscripts/facebook
break
;;
n|N)
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
python2 \script/samsung.py >> ./afwscripts/samsung
split -a 1 -d -l 100 ./afwscripts/samsung ./afwscripts/samsung
rm ./afwscripts/samsung
break
;;
n|N)
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
python2 \script/apple.py >>  ./afwscripts/apple
split -a 1 -d -l 100 ./afwscripts/apple ./afwscripts/apple
rm ./afwscripts/apple
break
;;
n|N)
break
;;
esac
done
clear
echo "Block Amazon? y/n"
echo
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo
echo "Note: The Amazon list is huge!"
echo "If AFWall hangs or doesn't apply rules then restart script and skip Amazon"
echo 
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo
echo -n ":"
while read Option
do
case $Option in
y|Y)
echo Adding Amazon ASN to list
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS16509' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > amazon.txt
python2 \script/amazon.py >>  ./afwscripts/amazon
split -a 1 -d -l 100 ./afwscripts/amazon ./afwscripts/amazon
rm ./afwscripts/amazon
break
;;
n|N)
break
;;
esac
done
clear
echo "Block Microsoft? y/n"
echo -n ":"
while read Option
do
case $Option in
y|Y)
echo Adding Microsoft ASN to list
curl --silent 'https://stat.ripe.net/data/announced-prefixes/data.json?preferred_version=1.1&resource=AS8075' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}' | uniq > microsoft.txt
python2 \script/microsoft.py >>  ./afwscripts/microsoft
split -a 1 -d -l 100 ./afwscripts/microsoft ./afwscripts/microsoft
rm ./afwscripts/microsoft
break
;;
n|N)
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
ls ./afwscripts >> list.txt
awk '{print ". /system/afwscripts/" $0}' list.txt >> afwscripts.txt
rm list.txt
cp ./script/iptables_off.sh ./afwscripts/
clear
echo "End of script..."
echo
echo
echo "Now copy the whole afwscripts folder to /system on your device."
echo "Additionally transfer afwscripts.txt onto the device."
echo
echo "Device: Open afwscripts.txt and copy all to the clipboard."
echo
echo "Open AFWall and press the three dots in the top right corner and select"
echo "<Set custom script>. Paste the contents of the clipboard to user defined script."
echo 
echo
echo "Now you must set the shutdown script path (user defined shutdown script)."
echo
echo "Enter this:   . /system/afwscripts/iptables_off.sh"
echo
echo "IMPORTANT: Don't forget the ". /" point-space-slash!!"
echo "##########################################################"
echo
echo
echo "Afterwards press OK and wait until AFWall applied the rules!"
echo 
echo
echo "Finally disable IPv6 Support in AFWall preferences->User Interface"
echo "Only IPv4 is working right now"
echo
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "Have fun and enjoy a bit more privacy!"
echo
echo "https://github.com/mglinux/afwall_easy"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
