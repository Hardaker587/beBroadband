RouterOS 6.46.5
# software id = SS0K-XKR9
#
# model = 960PGS
# serial number = AD8A09D53E7B
/interface bridge
add name=LAN
add name=Onsite-Access
/interface ethernet
set [ find default-name=ether1 ] name="ether1-WAN to Comsol"
set [ find default-name=ether2 ] name=ether2-AP1
set [ find default-name=ether3 ] name=ether3-AP2
set [ find default-name=ether4 ] name="ether4-Onsite Access1"
set [ find default-name=ether5 ] name="ether5-Onsite Access2"
/ip hotspot profile
set [ find default=true ] html-directory=flash/hotspot
add dns-name=be.hotspot hotspot-address=10.6.60.1 html-directory= flash/datatill_Golden-Views-Hotspot01 login-by= mac,cookie,http-chap,http-pap,trial,mac-cookie name= Golden-Views-Hotspot01 radius-interim-update=1m trial-uptime-limit=1d use-radius=true
/ip pool
add name=dhcp_pool0 ranges=10.6.60.2-10.6.60.254
add name=dhcp_pool1 ranges=192.168.90.2-192.168.90.254
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=false interface=LAN name=dhcp1
add address-pool=dhcp_pool1 disabled=false interface=Onsite-Access name=dhcp2
/ip hotspot
add address-pool=dhcp_pool0 disabled=false interface=LAN name= Golden-Views-Hotspot01 profile=Golden-Views-Hotspot01
/snmp community
add addresses=0.0.0.0/0 name=bebroadband
/user group
set full policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox,pas sword,web,sniff,sensitive,api,romon,dude,tikapp"
/interface bridge port
add bridge=LAN interface=ether2-AP1
add bridge=LAN interface=ether3-AP2
add bridge=Onsite-Access interface="ether4-Onsite Access1"
add bridge=Onsite-Access interface="ether5-Onsite Access2"
/ip accounting
set enabled=true threshold=8192
/ip address
add address=102.134.218.106/29 interface="ether1-WAN to Comsol" network= 102.134.218.104
add address=10.6.60.1/24 interface=LAN network=10.6.60.0
add address=192.168.90.1/24 interface=Onsite-Access network=192.168.90.0
/ip dhcp-server network
add address=10.6.60.0/24 dns-server=10.6.60.1 gateway=10.6.60.1
add address=192.168.90.0/24 dns-server=102.134.254.4,9.9.9.9 gateway= 192.168.90.1
/ip dns
set allow-remote-requests=true servers=102.134.254.4,9.9.9.9
/ip dns static
add address=10.6.60.1 name=be.hotspot
add address=188.166.66.208 name=unifi
/ip firewall filter
add action=reject chain=input dst-port=53 in-interface="ether1-WAN to Comsol" protocol=udp reject-with=icmp-host-unreachable
add action=reject chain=input dst-port=53 in-interface="ether1-WAN to Comsol" protocol=tcp reject-with=icmp-host-unreachable
add action=passthrough chain=unused-hs-chain comment= "place hotspot rules here" disabled=true
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment= "place hotspot rules here" disabled=true
add action=masquerade chain=srcnat disabled=true
add action=masquerade chain=srcnat comment="masquerade hotspot network" src-address=10.6.60.0/24
add action=masquerade chain=srcnat src-address=192.168.90.0/24
/ip hotspot user
set [ find default=true ] limit-bytes-in=100000000 limit-bytes-out=100000000
/ip hotspot walled-garden
add comment="place hotspot rules here" disabled=true
add comment="*.absa.co.za ABSA Banking" dst-host=*.absa.co.za
add comment="*.apple.com Apple Web Check" dst-host=*.apple.com
add comment="*.bankserv.co.za Bankserv Auth." dst-host=*.bankserv.co.za
add comment="*.bebroadband.co.za Datatill Server - Hostname" dst-host= *.bebroadband.co.za
add comment="*.fnb.co.za FNB Banking" dst-host=*.fnb.co.za
add comment="*.getsnapscan.com SnapScan Payment Gateway" dst-host= *.getsnapscan.com
add comment="*.gmail.com Gmail Email" dst-host=*.gmail.com
add comment="*.i-pay.co.za PayU I-Pay Payment Gateway" dst-host= *.i-pay.co.za
add comment="*.payfast.co.za PayFast Payment Gateway" dst-host= *.payfast.co.za
add comment="*.payu.co.za PayU Payment Gateway App" dst-host=*.payu.co.za
add comment="*.snapscan.co.za SnapScan Payment Gateway" dst-host= *.snapscan.co.za
add comment="*.snapscan.io SnapScan Payment Gateway App" dst-host= *.snapscan.io
add comment="*.standarbank.co.za Standard Bank Banking" dst-host= *.standarbank.co.za
add comment="*.zapper.com Zapper Payment Gateway" dst-host=*.zapper.com
add comment="*.zapzap.mobi Zapper Payment Gateway" dst-host=*.zapzap.mobi
add comment="Google DNS1 8.8.8.8" dst-host="Google DNS1"
add comment="Google DNS2 8.8.4.4" dst-host="Google DNS2"
/ip hotspot walled-garden ip
add action=accept comment="DNS2 [Dest:1.0.0.1]" disabled=false dst-address= 1.0.0.1
add action=accept comment="Golden Views Hotspot GW01 [Dest:102.134.218.106]" disabled=false dst-address=102.134.218.106
add action=accept comment="Comsol DNS1 [Dest:102.134.254.4]" disabled=false dst-address=102.134.254.4
add action=accept comment="DNS1 [Dest:102.67.156.1]" disabled=false dst-address=102.67.156.1
add action=accept comment="Hotspot GW [Dest:102.67.156.12]" disabled=false dst-address=102.67.156.12
add action=accept comment="Datatill Server - IP [Dest:178.128.143.98]" disabled=false dst-address=178.128.143.98
add action=accept comment="Unifi WiFi Controller [Dest:188.166.66.208]" disabled=false dst-address=188.166.66.208
add action=accept comment="Comsol DNS2 [Dest:9.9.9.9]" disabled=false dst-address=9.9.9.9
/ip route
add distance=1 gateway=102.134.218.105
/ip service
set telnet disabled=true
set www disabled=true
set api port=8787
set winbox port=8282
set api-ssl disabled=true
/ppp aaa
set interim-update=5m use-radius=true
/radius
add address=178.128.143.98 secret=B3Adm1nCor3!@3 service=ppp,login,hotspot src-address=102.134.218.106 timeout=3s
/radius incoming
set accept=true port=1700
/snmp
set contact="BeBroadband Technical" enabled=true location= "Stone Arch Centre, Germiston, JHB" trap-community=bebroadband
/system clock
set time-zone-name=Africa/Johannesburg
/system ntp client
set enabled=true server-dns-names=ntp.is.co.za
