#!/usr/bin/python2
from ipaddr import IPv4Network, CollapseAddrList
as_nets = list()
with open('microsoft.txt') as fh:
   for line in fh:
      net = IPv4Network(line.strip())
      as_nets.append(net)

for net in sorted(CollapseAddrList(as_nets)):
   print "$IPTABLES -A \"afwall\" -d %s -j REJECT" % (net) 
