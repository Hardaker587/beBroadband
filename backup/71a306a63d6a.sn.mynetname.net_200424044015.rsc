RouterOS 6.46.4
# software id = 1YN7-XPXI
#
# model = 951Ui-2nD
# serial number = 71A306A63D6A
/interface bridge
add name=HS-Bridge
add fast-forward=false name=LAN
add name=WAN-Bridge
/interface ethernet
set [ find default-name=ether1 ] advertise= 10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name= ether1-WAN
set [ find default-name=ether2 ] advertise= 10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name= ether2-LAN1
set [ find default-name=ether3 ] advertise= 10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name= ether3-LAN2
set [ find default-name=ether4 ] advertise= 10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name= ether4-PS4
set [ find default-name=ether5 ] advertise= 10M-half,10M-full,100M-half,100M-full,1000M-half,1000M-full name= ether5-WAN2
/interface pppoe-client
add add-default-route=true disabled=no interface=WAN-Bridge keepalive-timeout=60 max-mtu=1480 name=pppoe-out1 password="W1F1bR300 $" user=wifibre092@bebroadband
/interface wireless
set [ find default-name=wlan1 ] antenna-gain=1 band=2ghz-b/g/n basic-rates-a/g=24Mbps,36Mbps,48Mbps,54Mbps basic-rates-b=11Mbps channel-width=20/40mhz-eC country=no_country_set disabled=no frequency=2432 frequency-mode=manual-txpower mode=ap-bridge rate-set= configured ssid=wifibre092-bebroadband supported-rates-a/g= 24Mbps,36Mbps,48Mbps,54Mbps supported-rates-b=11Mbps wireless-protocol= 802.11
/interface list
add name=WAN
/interface wireless security-profiles
set [ find default=true ] authentication-types=wpa-psk,wpa2-psk mode= dynamic-keys supplicant-identity=MikroTik wpa-pre-shared-key=0646201647 wpa2-pre-shared-key=0646201647
/ip hotspot profile
set [ find default=true ] html-directory=flash/hotspot
/ip pool
add name=dhcp ranges=192.168.90.2-192.168.90.254
add name=dhcp_pool1 ranges=192.168.91.2-192.168.91.254
/ip dhcp-server
add address-pool=dhcp authoritative=after-2sec-delay disabled=no interface=LAN name=dhcp1
# DHCP server can not run on slave interface!
add address-pool=dhcp_pool1 disabled=no interface=wlan1 name=dhcp2
/snmp community
add addresses=0.0.0.0/0 name=bebroadband
/interface bridge port
add bridge=LAN interface=wlan1
add bridge=WAN-Bridge hw=false interface=ether5-WAN2
add bridge=WAN-Bridge hw=false interface=ether4-PS4
add bridge=LAN hw=false interface=ether3-LAN2
add bridge=LAN hw=false interface=ether2-LAN1
add bridge=WAN-Bridge interface=ether1-WAN
/interface l2tp-server server
set use-ipsec=yes
/interface list member
add interface=pppoe-out1 list=WAN
add interface=LAN
add interface=ether1-WAN list=WAN
add interface=ether2-LAN1
add interface=ether3-LAN2
add interface=ether4-PS4
add interface=ether5-WAN2
add interface=wlan1
/interface sstp-server server
set default-profile=default-encryption
/ip accounting
set enabled=true threshold=8192
/ip address
add address=192.168.90.1/24 interface=ether2-LAN1 network=192.168.90.0
/ip cloud
set ddns-enabled=true
/ip dhcp-client
add interface=ether1-WAN
/ip dhcp-server lease
add address=192.168.90.245 client-id=1:2c:cc:44:17:76:93 mac-address= 2C:CC:44:17:76:93 server=dhcp1
/ip dhcp-server network
add address=192.168.90.0/24 dns-server=1.0.0.1,8.8.8.8 gateway=192.168.90.1
/ip dns
set servers=1.0.0.1,8.8.8.8
/ip firewall filter
add action=accept chain=forward dst-port=3799 in-interface=WAN-Bridge protocol=udp
add action=accept chain=input dst-port=3799 in-interface=WAN-Bridge protocol= udp
add action=accept chain=forward dst-port=1813 in-interface=WAN-Bridge protocol=udp
add action=accept chain=input dst-port=1813 in-interface=WAN-Bridge protocol= udp
add action=accept chain=forward dst-port=1812 in-interface=WAN-Bridge protocol=udp
add action=accept chain=input dst-port=1812 in-interface=WAN-Bridge protocol= udp
/ip firewall nat
add action=masquerade chain=srcnat
add action=dst-nat chain=dstnat dst-port=3074 in-interface=pppoe-out1 protocol=udp to-addresses=192.168.90.245 to-ports=3074
add action=dst-nat chain=dstnat dst-port=1935 in-interface=pppoe-out1 protocol=tcp to-addresses=192.168.90.245 to-ports=1935
add action=dst-nat chain=dstnat dst-port=3478-3480 in-interface=pppoe-out1 protocol=tcp to-addresses=192.168.90.245 to-ports=3478-3480
add action=dst-nat chain=dstnat dst-port=3478-3480 in-interface=pppoe-out1 protocol=udp to-addresses=192.168.90.245 to-ports=3478-3480
add action=dst-nat chain=dstnat dst-port=3074 in-interface=pppoe-out1 protocol=tcp to-addresses=192.168.90.245 to-ports=3074
add action=dst-nat chain=dstnat dst-port=3075 in-interface=pppoe-out1 protocol=udp to-addresses=192.168.90.245 to-ports=3075
add action=dst-nat chain=dstnat dst-port=3075 in-interface=pppoe-out1 protocol=tcp to-addresses=192.168.90.245 to-ports=3075
add action=dst-nat chain=dstnat dst-port=3076 in-interface=pppoe-out1 protocol=tcp to-addresses=192.168.90.245 to-ports=3076
add action=dst-nat chain=dstnat dst-port=3076 in-interface=pppoe-out1 protocol=udp to-addresses=192.168.90.245 to-ports=3076
/ip service
set telnet disabled=yes
set www disabled=yes
set ssh disabled=yes
set api port=8787
set winbox port=8282
set api-ssl disabled=yes
/ip traffic-flow
set enabled=true
/ip traffic-flow target
add dst-address=41.76.109.191 port=9993 version=5
/ip upnp
set enabled=true
/ip upnp interfaces
add interface=LAN type=internal
add interface=pppoe-out1 type=external
add interface=ether4-PS4 type=internal
/ppp secret
add name=vpn
/snmp
set contact=support@bebroadband.co.za enabled=true trap-community=bebroadband
/system clock
set time-zone-name=Africa/Johannesburg
/system ntp client
set enabled=true server-dns-names=ntp.is.co.za
