RouterOS 6.44.5
# software id = 6YNN-2VN0
#
# model = RB941-2nD
# serial number = CC290BEC0357
/interface bridge
add name=LAN
/interface ethernet
set [ find default-name=ether1 ] mac-address=74:4D:28:02:22:9A name= ether1-WAN
set [ find default-name=ether2 ] mac-address=74:4D:28:02:22:9B name= ether2-HS-Uplink
set [ find default-name=ether3 ] mac-address=74:4D:28:02:22:9C name= ether3-LAN2
set [ find default-name=ether4 ] mac-address=74:4D:28:02:22:9D name= ether4-LAN3
/interface pppoe-client
add add-default-route=true disabled=false interface=ether1-WAN name= pppoe-out1 password=hotspot1 user=hotspot1
/interface pwr-line
set [ find default-name=pwr-line1 ] mac-address=74:4D:28:02:22:9E
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g/n disabled=false mode=ap-bridge name=wlan2 ssid="Free WiFi" wireless-protocol=802.11
/interface list
add name=WAN
/interface wireless security-profiles
set [ find default=true ] supplicant-identity=MikroTik
/ip hotspot profile
add dns-name=be.hotspot hotspot-address=10.6.60.1 html-directory= datatill_hotspot1 http-cookie-lifetime=1d login-by= mac,cookie,http-chap,http-pap,trial,mac-cookie name=hotspot1 radius-interim-update=10s trial-uptime-limit=1d use-radius=true
/ip pool
add name=dhcp_pool0 ranges=192.168.50.2-192.168.50.254
add name=dhcp ranges=10.6.60.2-10.6.60.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface=LAN name=dhcp1
add address-pool=dhcp disabled=false interface=LAN lease-time=1h name=dhcp2
/ip hotspot
add address-pool=dhcp addresses-per-mac=1 disabled=false idle-timeout=none interface=LAN keepalive-timeout=1d name=hotspot1 profile=hotspot1
/ip hotspot user profile
set [ find default=true ] address-pool=dhcp
/snmp community
add addresses=0.0.0.0/0 name=bebroadband
/interface bridge port
add bridge=LAN interface=wlan2
add bridge=LAN interface=ether4-LAN3
add bridge=LAN interface=ether3-LAN2
add bridge=LAN interface=ether2-HS-Uplink
/interface list member
add interface=pppoe-out1 list=WAN
add interface=LAN
/ip accounting
set enabled=true threshold=8192
/ip address
add address=192.168.50.1/24 disabled=true interface=LAN network=192.168.50.0
add address=10.6.60.1/24 interface=ether2-HS-Uplink network=10.6.60.0
/ip dhcp-server network
add address=10.6.60.0/24 comment="hotspot network" dns-server=10.6.60.1 gateway=10.6.60.1
add address=192.168.50.0/24 dns-server=102.67.156.1 gateway=192.168.50.1
/ip dns
set servers=8.8.8.8
/ip dns static
add address=188.166.66.208 name=unifi
add address=10.6.60.1 name=be.hotspot
/ip firewall filter
add action=accept chain=input protocol=udp src-port=1700-1701
add action=accept chain=input protocol=tcp src-port=1700-1701
add action=accept chain=input protocol=udp src-port=3799
add action=accept chain=input protocol=tcp src-port=3799
add action=accept chain=input protocol=udp src-port=1812-1813
add action=accept chain=input protocol=tcp src-port=1812-1813
add action=passthrough chain=unused-hs-chain comment= "place hotspot rules here" disabled=true
add action=reject chain=input dst-port=53 in-interface=ether1-WAN protocol= udp reject-with=icmp-host-unreachable
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment= "place hotspot rules here" disabled=true
add action=masquerade chain=srcnat src-address=192.168.50.0/24
add action=masquerade chain=srcnat comment="masquerade hotspot network" src-address=10.6.60.0/24
/ip hotspot walled-garden
add comment="place hotspot rules here" disabled=true
add comment="*.absa.co.za ABSA Banking" dst-host=*.absa.co.za
add comment="*.apple.com Apple Web Check" dst-host=*.apple.com
add comment="*.bankserv.co.za Bankserv Auth." dst-host=*.bankserv.co.za
add comment="*.bebroadband.co.za Datatill Server - Hostname" dst-host= *.bebroadband.co.za
add comment="*.flash.co.za 1voucher Payment Gateway" dst-host=*.flash.co.za
add comment="*.fnb.co.za FNB Banking" dst-host=*.fnb.co.za
add comment="*.getsnapscan.com SnapScan Payment Gateway" dst-host= *.getsnapscan.com
add comment="*.gmail.com Gmail Email" dst-host=*.gmail.com
add comment="*.i-pay.co.za PayU I-Pay Payment Gateway" dst-host= *.i-pay.co.za
add comment="*.lintegfibre.co.za Linteg Fibre Website" dst-host= *.lintegfibre.co.za
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
/ip service
set telnet disabled=true
set ftp port=2121
set www disabled=true
set ssh port=2222
set api port=8787
set winbox port=8282
set api-ssl disabled=true
/ppp aaa
set use-radius=true
/radius
add address=41.76.109.191 secret=B3Adm1nCor3!@3 service=ppp,login,hotspot src-address=102.67.156.12 timeout=3s
/radius incoming
set accept=true port=1700
/snmp
set enabled=true trap-community=bebroadband
/system clock
set time-zone-name=Africa/Johannesburg
/system logging
add topics=radius,debug,info
/system ntp client
set enabled=true server-dns-names=ntp.is.co.za
