RouterOS 6.46.4
# software id = KLAK-WNT3
#
# model = RB4011iGS+
# serial number = 96B10ACA559C
/interface bridge
add name=LAN
add name=LAN_APs
/interface ethernet
set [ find default-name=ether1 ] name="ether1-PtP to Sports (AP11)" rx-flow-control=auto tx-flow-control=auto
set [ find default-name=ether2 ] name="ether2-Riaan Home"
set [ find default-name=ether3 ] name="ether3-Onsite Access"
set [ find default-name=ether4 ] disabled=true
set [ find default-name=ether5 ] name="ether5-Vuma Core"
set [ find default-name=ether6 ] disabled=true
set [ find default-name=ether7 ] disabled=true
set [ find default-name=ether8 ] disabled=true
set [ find default-name=ether9 ] name="ether9-PtP2 to Sports (AP10)"
set [ find default-name=ether10 ] disabled=true poe-out=off
set [ find default-name=sfp-sfpplus1 ] disabled=true
/interface ethernet switch port
set 0 default-vlan-id=0
set 1 default-vlan-id=0
set 2 default-vlan-id=0
set 3 default-vlan-id=0
set 4 default-vlan-id=0
set 5 default-vlan-id=0
set 6 default-vlan-id=0
set 7 default-vlan-id=0
set 8 default-vlan-id=0
set 9 default-vlan-id=0
set 10 default-vlan-id=0
set 11 default-vlan-id=0
/interface wireless security-profiles
set [ find default=true ] supplicant-identity=MikroTik
/ip pool
add name="PPP Pool Vuma Core" ranges=192.168.10.2-192.168.10.254
add name=VPN ranges=172.168.0.254-172.168.10.2
add name=dhcp_pool2 ranges=192.168.90.2-192.168.90.254
/ip dhcp-server
add address-pool=dhcp_pool2 disabled=false interface=LAN name=dhcp1
/ppp profile
set *0 use-encryption=no use-upnp=yes
add local-address=10.10.10.40 name=VPN only-one=no remote-address= "PPP Pool Vuma Core"
add dns-server=1.0.0.1,8.8.8.8 local-address=10.10.10.40 name= "Wi-Fibre Default Profile" only-one=yes remote-address= "PPP Pool Vuma Core" use-encryption=no
add dns-server=1.0.0.1,8.8.8.8 local-address=10.10.10.40 name= "Philip Willemse Access" remote-address="PPP Pool Vuma Core"
add dns-server=1.0.0.1,8.8.8.8 local-address=10.10.10.40 name= "Router Access (Primary) Static IP" remote-address=192.168.2.5
/queue simple
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre017@bebroadband target=192.168.10.148/32
add max-limit=20971520/20971520 name=DT_AUTO_QUEUE_wifibre051@bebroadband target=192.168.10.203/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre054@bebroadband target=192.168.10.228/32
add max-limit=4194304/4194304 name=DT_AUTO_QUEUE_wifibre070@bebroadband target=192.168.10.212/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre009@bebroadband target=192.168.10.222/32
add max-limit=20971520/20971520 name=DT_AUTO_QUEUE_wifibre002@bebroadband target=102.67.157.250/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre005@bebroadband target=102.67.157.57/32
add max-limit=4194304/4194304 name=DT_AUTO_QUEUE_wifibre004@bebroadband target=102.67.157.53/32
add max-limit=104857600/104857600 name=DT_AUTO_QUEUE_wifibre092@bebroadband target=102.67.157.55/32
/snmp community
add addresses=::/0 name=bebroadband
/interface bridge port
add bridge=LAN interface="ether2-Riaan Home"
add bridge=LAN interface="ether3-Onsite Access"
add bridge=LAN_APs interface="ether1-PtP to Sports (AP11)"
add bridge=LAN_APs interface="ether9-PtP2 to Sports (AP10)"
/interface l2tp-server server
set default-profile="Wi-Fibre Default Profile" enabled=true ipsec-secret= B3IPs#cPass!@3 use-ipsec=required
/interface pppoe-server server
add default-profile="Wi-Fibre Default Profile" disabled=false interface= LAN_APs keepalive-timeout=30 service-name="Wi-Fibre Core (Sports)"
/interface pptp-server server
set default-profile="Wi-Fibre Default Profile" enabled=true
/interface sstp-server server
set default-profile="Wi-Fibre Default Profile" max-mru=1450 max-mtu=1450
/ip address
add address=10.200.100.1/24 interface="ether1-PtP to Sports (AP11)" network= 10.200.100.0
add address=10.200.200.1/24 interface="ether1-PtP to Sports (AP11)" network= 10.200.200.0
add address=192.168.90.1/24 interface=LAN network=192.168.90.0
add address=10.200.96.2/20 interface=LAN_APs network=10.200.96.0
add address=192.168.1.21/24 interface=LAN_APs network=192.168.1.0
/ip cloud
set ddns-enabled=true
/ip dhcp-client
add disabled=false interface="ether5-Vuma Core"
/ip dhcp-server lease
add address=192.168.90.254 client-id=1:74:4d:28:a4:3c:47 mac-address= 74:4D:28:A4:3C:47 server=dhcp1
/ip dhcp-server network
add address=192.168.90.0/24 dns-server=1.0.0.1,8.8.8.8 gateway=192.168.90.1
/ip firewall address-list
add address=216.144.250.150 list="Uptime Robot Access"
add address=69.162.124.226 list="Uptime Robot Access"
add address=69.162.124.227 list="Uptime Robot Access"
add address=69.162.124.228 list="Uptime Robot Access"
add address=69.162.124.229 list="Uptime Robot Access"
add address=69.162.124.230 list="Uptime Robot Access"
add address=69.162.124.231 list="Uptime Robot Access"
add address=69.162.124.232 list="Uptime Robot Access"
add address=69.162.124.233 list="Uptime Robot Access"
add address=69.162.124.234 list="Uptime Robot Access"
add address=69.162.124.235 list="Uptime Robot Access"
add address=69.162.124.236 list="Uptime Robot Access"
add address=69.162.124.237 list="Uptime Robot Access"
add address=63.143.42.242 list="Uptime Robot Access"
add address=63.143.42.243 list="Uptime Robot Access"
add address=63.143.42.244 list="Uptime Robot Access"
add address=63.143.42.245 list="Uptime Robot Access"
add address=63.143.42.246 list="Uptime Robot Access"
add address=63.143.42.247 list="Uptime Robot Access"
add address=63.143.42.248 list="Uptime Robot Access"
add address=63.143.42.249 list="Uptime Robot Access"
add address=63.143.42.250 list="Uptime Robot Access"
add address=63.143.42.251 list="Uptime Robot Access"
add address=63.143.42.252 list="Uptime Robot Access"
add address=63.143.42.253 list="Uptime Robot Access"
add address=216.245.221.82 list="Uptime Robot Access"
add address=216.245.221.83 list="Uptime Robot Access"
add address=216.245.221.84 list="Uptime Robot Access"
add address=216.245.221.85 list="Uptime Robot Access"
add address=216.245.221.86 list="Uptime Robot Access"
add address=216.245.221.87 list="Uptime Robot Access"
add address=216.245.221.88 list="Uptime Robot Access"
add address=216.245.221.89 list="Uptime Robot Access"
add address=216.245.221.90 list="Uptime Robot Access"
add address=216.245.221.91 list="Uptime Robot Access"
add address=216.245.221.92 list="Uptime Robot Access"
add address=216.245.221.93 list="Uptime Robot Access"
add address=46.137.190.132 list="Uptime Robot Access"
add address=122.248.234.23 list="Uptime Robot Access"
add address=188.226.183.141 list="Uptime Robot Access"
add address=178.62.52.237 list="Uptime Robot Access"
add address=54.79.28.129 list="Uptime Robot Access"
add address=54.94.142.218 list="Uptime Robot Access"
add address=104.131.107.63 list="Uptime Robot Access"
add address=54.67.10.127 list="Uptime Robot Access"
add address=54.64.67.106 list="Uptime Robot Access"
add address=159.203.30.41 list="Uptime Robot Access"
add address=46.101.250.135 list="Uptime Robot Access"
add address=18.221.56.27 list="Uptime Robot Access"
add address=52.60.129.180 list="Uptime Robot Access"
add address=159.89.8.111 list="Uptime Robot Access"
add address=146.185.143.14 list="Uptime Robot Access"
add address=139.59.173.249 list="Uptime Robot Access"
add address=165.227.83.148 list="Uptime Robot Access"
add address=128.199.195.156 list="Uptime Robot Access"
add address=138.197.150.151 list="Uptime Robot Access"
add address=34.233.66.117 list="Uptime Robot Access"
/ip firewall filter
add action=accept chain=input dst-port=8282 in-interface="ether5-Vuma Core" protocol=tcp
/ip firewall nat
add action=masquerade chain=srcnat
add action=dst-nat chain=dstnat dst-port=8411 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.96.31 to-ports=443
add action=dst-nat chain=dstnat dst-port=8496 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.96.30 to-ports=443
add action=dst-nat chain=dstnat dst-port=8120 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.48 to-ports=443
add action=dst-nat chain=dstnat dst-port=8121 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.47 to-ports=443
add action=dst-nat chain=dstnat dst-port=8004 protocol=tcp to-addresses= 192.168.2.5 to-ports=8004
add action=dst-nat chain=dstnat dst-port=1004 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=192.168.90.254 to-ports=8282
add action=dst-nat chain=dstnat dst-port=7848 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.49 to-ports=443
add action=dst-nat chain=dstnat dst-port=7849 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.50 to-ports=443
/ip service
set telnet disabled=true
set www disabled=true
set ssh disabled=true
set api port=8787
set winbox port=8282
set api-ssl disabled=true
/ip ssh
set allow-none-crypto=true forwarding-enabled=remote
/ppp aaa
set use-radius=true
/ppp secret
add name=wifibre025@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre027@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre026@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre006@bebroadband password=W1F1bR300^ profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre002@bebroadband password=W1F1bR300@ profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre007@bebroadband password=W1F1bR300& profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre010@bebroadband password="W1F1bR30!)" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre008@bebroadband password=W1F1bR300* profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre004@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre014@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre013@bebroadband password=W1F1bR300# profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre015@bebroadband password=W1F1bR300# profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre016@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre017@bebroadband (Migrated to DT)" password= W1F1bR300% profile="Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre018@bebroadband password=W1F1bR300^ profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre005@bebroadband (Migrated to DT)" password= W1F1bR300% profile="Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre011@bebroadband(ACCOUNT CANCELLED)" password= W1F1bR300! profile="Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre012@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre022@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre024@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre021@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre019@bebroadband password=W1F1bR300* profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre028@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre001@bebroadband password=W1F1bR300! profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre003@bebroadband password=W1F1bR300# profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre023@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre029@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre020@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre030@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre031@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre032@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre033@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre034@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre035@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre036@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre037@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre039@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre038@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre040@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre041@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre042@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre043@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre044@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre045@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre046@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre047@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre048@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre049@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre050@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre051@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre052@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre053@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre054@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre055@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre056@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre057@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre058@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre059@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre060@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre061@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre062@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre063@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre064@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre065@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre066@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre067@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre068@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre069@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre070@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre071@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre072@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre073@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre074@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre075@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre076@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre077@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre078@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre079@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre080@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre081@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre082@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre083@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre085@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre086@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre084@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre087@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre088@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre089@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre090@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre091@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre092V2@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre093@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre094@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre095@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre096@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre097@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre098@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre099@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre100@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre101@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre102@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre103@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre104@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre105@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre106@bebroadband(ACCOUNT CANCELLED" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre107@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre108@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre109@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre110@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre111@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre112@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre113@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre114@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre115@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre116@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre117@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre118@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre119@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre120@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre122@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre125@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre126@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre127@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre142@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre143@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre140@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre138@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre121@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre123@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre124@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name="wifibre128@bebroadband(ACCOUNT CANCELLED)" password="W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre129@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre130@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre131@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre133@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre134@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre135@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre136@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre137@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre151@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre153@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre149@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre156@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre152@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre158@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre166@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre171@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre173@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre172@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre167@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre165@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre145@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre179@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre178@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre176@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre182@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre144@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre132@bebroadband password="W1F1bR300 $" service=pppoe
add name=wifibre139@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre141@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre146@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre147@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre148@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre150@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre154@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre155@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre157@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre159@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre160@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre161@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre162@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre163@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre164@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre168@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre169@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre170@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre174@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre175@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre177@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre180@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre181@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre183@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre184@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre185@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre186@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre187@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre188@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre189@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre190@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre191@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre192@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre193@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre195@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre194@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre196@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre197@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre198@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre199@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre200@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre201@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre202@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre203@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre204@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre205@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre207@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre208@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre209@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre210@bebroadband ACCOUNT SUSPENDED" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre211@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre212@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre213@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre214@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre215@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre216@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre217@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre218@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre219@bebroadband password=Password!@3 profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre220@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre221@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre222@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre223@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre224@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre225@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre226@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre227@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre228@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=vumateltosportl2tp password="VumatelTOsportsL2TP " profile= "Wi-Fibre Default Profile" service=l2tp
add name=wifibre230@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre231@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre232@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre233@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre234@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre235@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre236@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre237@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre238@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre239@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre240@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre241@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre242@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre243@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre244@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre245@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre246@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre247@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre248@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre249@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre250@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre251@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre252@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre253@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre254@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre255@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre256@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre257@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre258@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre259@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre260@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre261@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre262@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre263@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre264@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre265@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre266@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre267@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre268@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre269@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre270@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre271@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre272@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre273@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre274@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre275@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre276@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre277@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre278@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre279@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre280@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre281@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre282@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre283@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre284@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre285@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre286@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre287@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre288@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre289@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre290@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre291@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre292@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre293@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre294@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre295@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre296@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre297@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre298@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre299@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre300@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre301@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre302@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre303@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre304@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre305@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre306@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre307@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre309@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre308@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre310@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre311@bebroadband ACCOUNT CANCELLED" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre312@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre313@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre314@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre315@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre316@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre317@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre318@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre319@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre320@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre321@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre322@bebroadband (ACCOUNT CANCELLED)" password= "W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre323@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre324@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre325@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre326@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre327@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre328@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre329@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre330@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre331@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre332@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre333@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre334@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre335@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre229@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre336@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre337@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre338@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre339@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre340@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre341@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre342@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre343@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre344@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre345@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre346@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre347@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre348@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre349@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre350@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre351@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre352@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre353@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre354@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre355@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre356@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre357@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre358@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre359@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre361@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre362@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre206@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre363@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre364@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre365@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre079V2@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre366@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name=wifibre092@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=philip.willemse password="Phillip!@#123 $" profile= "Wi-Fibre Default Profile" service=l2tp
add disabled=true name=wifibre367@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre370@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre371@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre372@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre374@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre376@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre378@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre379@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre381@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre383@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre384@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre385@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre386@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre387@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre388@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre389@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre390@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre391@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre393@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre397@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre396@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre399@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre401@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre402@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre403@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name="wifibre373@bebroadband ACCOUNT SUSPENDED" password="W1F1bR300 $" profile="Wi-Fibre Default Profile" service=pppoe
add name=wifibre392@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre404@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre377@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre405@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre406@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre407@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre408@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre409@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre411@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre412@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add disabled=true name="wifibre009@bebroadband (Migrated to DT)" password= "W1F1bR300(" profile="Wi-Fibre Default Profile" service=pppoe
add name=albermarlecore@bebroadband password=P@ssword!@3 profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre433@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre438@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre447@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre455@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre458@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre473@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre476@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre481@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre468@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre484@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=SportsH.S-Failover@bebroadband password=P@ssword!@3 profile= "Router Access (Primary) Static IP" service=pppoe
add name=wifibre486@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre487@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre451@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre490@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre491@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre497@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre499@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre503@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=amith.gosai password=Am!th!@3 profile="Wi-Fibre Default Profile" service=l2tp
add name=wifibre507@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre508@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre500@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre515@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre482@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=SportsH.S-Failover2@bebroadband password=P@ssword!@3 profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre443@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre527@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre466@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre526@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
add name=wifibre534@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre Default Profile" service=pppoe
/radius
add address=41.76.109.191 secret=B3Adm1nCor3!@3 service=ppp,login src-address=41.193.239.184
/radius incoming
set accept=true
/snmp
set enabled=true trap-community=bebroadband
/system clock
set time-zone-name=Africa/Johannesburg
/system identity
set name="Vumatel Core"
