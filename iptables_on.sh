##
## iptables.sh	
## AFWall+ additional firewall rules
## Mike Kuketz
## www.kuketz-blog.de
## Changes: 25.08.2014
##

IPTABLES=/system/bin/iptables
IP6TABLES=/system/bin/ip6tables 

# All 'afwall' chains/rules gets flushed automatically, before the custom script is executed

# Flush/Purge all rules expect OUTPUT (quits with error)
$IPTABLES -F INPUT
$IPTABLES -F FORWARD
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
$IP6TABLES -F INPUT
$IP6TABLES -F FORWARD
$IP6TABLES -t nat -F
$IP6TABLES -t mangle -F

# Flush/Purge all chains 
$IPTABLES -X 
$IPTABLES -t nat -X 
$IPTABLES -t mangle -X 
$IP6TABLES -X 
$IP6TABLES -t nat -X 
$IP6TABLES -t mangle -X

# Deny IPv6 connections  
$IP6TABLES -P INPUT DROP  
$IP6TABLES -P FORWARD DROP  
$IP6TABLES -P OUTPUT DROP

# DNS Server and custom rules generated from the script
$IPTABLES -t nat -I OUTPUT -p tcp --dport 53 -j DNAT --to-destination 84.200.69.80:53
$IPTABLES -t nat -I OUTPUT -p udp --dport 53 -j DNAT --to-destination 84.200.69.80:53
$IPTABLES -A 'afwall' -d 8.8.4.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 8.8.8.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 8.34.208.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 8.35.192.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 23.236.48.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 23.251.128.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 64.233.160.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 66.102.0.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 66.249.64.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 70.32.128.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 72.14.192.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 74.114.24.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 74.125.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 104.132.0.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 104.132.5.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 104.132.7.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 104.132.8.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 104.132.11.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 104.132.34.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 104.132.51.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 104.133.0.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 104.133.2.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 104.154.0.0/15 -j REJECT
$IPTABLES -A 'afwall' -d 104.196.0.0/14 -j REJECT
$IPTABLES -A 'afwall' -d 107.167.160.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 107.178.192.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 108.59.80.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 108.170.192.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 108.177.0.0/17 -j REJECT
$IPTABLES -A 'afwall' -d 130.211.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 142.250.0.0/15 -j REJECT
$IPTABLES -A 'afwall' -d 146.148.0.0/17 -j REJECT
$IPTABLES -A 'afwall' -d 162.216.148.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 162.222.176.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 172.0.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 172.102.8.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 172.110.32.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 172.217.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 172.253.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 173.194.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 173.255.112.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 185.25.28.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 185.150.148.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 192.104.160.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 192.158.28.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 192.178.0.0/15 -j REJECT
$IPTABLES -A 'afwall' -d 193.200.222.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 199.192.112.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 199.223.232.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 207.223.160.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 208.68.108.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 209.85.128.0/17 -j REJECT
$IPTABLES -A 'afwall' -d 209.107.176.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 216.58.192.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 216.73.80.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 216.239.32.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 216.252.220.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 31.13.24.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 31.13.64.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 45.64.40.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 66.220.144.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 69.63.176.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 69.171.224.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 74.119.76.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 103.4.96.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 157.240.0.0/17 -j REJECT
$IPTABLES -A 'afwall' -d 173.252.64.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 179.60.192.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 185.60.216.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 204.15.20.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 63.124.78.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 112.106.0.0/15 -j REJECT
$IPTABLES -A 'afwall' -d 112.108.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 121.252.0.0/15 -j REJECT
$IPTABLES -A 'afwall' -d 122.101.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 123.32.0.0/12 -j REJECT
$IPTABLES -A 'afwall' -d 157.197.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 165.213.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 166.79.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 166.103.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 168.219.0.0/16 -j REJECT
$IPTABLES -A 'afwall' -d 182.192.0.0/13 -j REJECT
$IPTABLES -A 'afwall' -d 194.133.18.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 202.20.128.0/17 -j REJECT
$IPTABLES -A 'afwall' -d 203.126.64.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.48.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.132.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.136.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.144.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.152.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.154.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.156.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 203.241.160.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 203.242.96.0/20 -j REJECT
$IPTABLES -A 'afwall' -d 203.244.96.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 203.244.192.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 203.246.140.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 203.246.144.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 203.246.146.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 203.246.149.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 203.246.157.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 203.246.190.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 203.246.192.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 203.249.192.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 203.254.192.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 206.67.236.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 207.140.43.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 208.248.44.0/24 -j REJECT
$IPTABLES -A 'afwall' -d 210.94.32.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 210.118.32.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 210.118.64.0/18 -j REJECT
$IPTABLES -A 'afwall' -d 211.36.64.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 211.45.0.0/19 -j REJECT
$IPTABLES -A 'afwall' -d 211.189.0.0/17 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.0.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.10.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.12.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.16.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.20.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.24.0/21 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.34.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.36.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.52.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.56.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.66.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.68.0/22 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.82.0/23 -j REJECT
$IPTABLES -A 'afwall' -d 17.253.84.0/23 -j REJECT
