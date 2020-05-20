RouterOS 6.46.4
# software id = 37IA-HZXM
#
# model = RB4011iGS+
# serial number = 968A09EE06DF
/interface ethernet
set [ find default-name=ether1 ] disabled=true
set [ find default-name=ether2 ] disabled=true
set [ find default-name=ether3 ] name="ether3 Jaco House"
set [ find default-name=ether4 ] name="ether4-Denton to King PtP"
set [ find default-name=ether5 ] name="ether5 Onsite Access"
set [ find default-name=ether6 ] disabled=true
set [ find default-name=ether7 ] name="ether7-SADV WAN" rx-flow-control=on tx-flow-control=on
set [ find default-name=ether8 ] disabled=true
set [ find default-name=ether9 ] disabled=true
set [ find default-name=ether10 ] disabled=true
set [ find default-name=sfp-sfpplus1 ] auto-negotiation=false disabled=true loop-protect=off speed=100Mbps
/interface pppoe-client
add add-default-route=true disabled=false interface="ether7-SADV WAN" name= pppoe-out2 password=jqwh2s3w use-peer-dns=true user= bebroa-pauven2-germiston-ftth-sadv@macrolan.co.za
/interface wireless security-profiles
set [ find default=true ] supplicant-identity=MikroTik
/ip firewall layer7-protocol
add comment="Block Torrents" name=block-torrents regexp="^( x13bittorrent pro tocol|azver x01 $|get /scrape ?info_hash=get /announce ?info_hash=|ge t /client/bitcomet/|GET /data ?fid=)|d1:ad2:id20:| x08'7P )[RP]"
/ip pool
add name="PPP Pool Alberton Core (Be IP's)" ranges= 192.168.20.2-192.168.20.254
add name=VPN ranges=172.168.1.1-172.168.1.10
add name="Denton PPP Pool" ranges=10.20.20.2-10.20.20.254
add name=dhcp_pool3 ranges=10.20.20.2-10.20.20.254
/ppp profile
set *0 use-upnp=yes
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.20.1 name="Wi-Fibre PPP" only-one=no remote-address="PPP Pool Alberton Core (Be IP's)" use-encryption=no
add local-address=VPN name=VPN remote-address=VPN
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.20.1 name= "Jaco Static IP" only-one=yes remote-address=192.168.1.3 use-encryption= no
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.20.1 name= "Router Access (Primary) Static IP" only-one=yes remote-address= 192.168.2.3 use-encryption=no
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.20.1 name= "Router Access (Backup) Static IP" only-one=yes remote-address= 192.168.2.4 use-encryption=no
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.20.1 name= "PhilipW Static IP" only-one=yes remote-address=192.168.20.226 use-encryption=no
/queue simple
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre061@bebroadband target=192.168.10.205/32
add max-limit=4194304/4194304 name=DT_AUTO_QUEUE_wifibre049@bebroadband target=192.168.10.206/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre023@bebroadband target=192.168.20.237/32
add max-limit=20971520/20971520 name=DT_AUTO_QUEUE_wifibre032@bebroadband target=192.168.20.247/32
add max-limit=4194304/4194304 name=DT_AUTO_QUEUE_wifibre059@bebroadband target=192.168.20.219/32
add max-limit=4194304/4194304 name=DT_AUTO_QUEUE_wifibre037@bebroadband target=192.168.20.253/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre003@bebroadband target=192.168.20.208/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre016@bebroadband target=192.168.20.213/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre030@bebroadband target=192.168.20.209/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre045@bebroadband target=192.168.20.214/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre036@bebroadband target=192.168.20.211/32
add max-limit=4194304/4194304 name=DT_AUTO_QUEUE_wifibre065@bebroadband target=192.168.20.161/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre073@bebroadband target=192.168.20.226/32
add max-limit=104857600/104857600 name=DT_AUTO_QUEUE_wifibre079@bebroadband target=192.168.20.198/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre082@bebroadband target=192.168.20.144/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre085@bebroadband target=192.168.20.227/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre095@bebroadband target=192.168.20.210/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre149@bebroadband target=192.168.20.242/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre150@bebroadband target=192.168.20.230/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre170@bebroadband target=192.168.20.249/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre020@bebroadband target=192.168.20.215/32
add max-limit=4194304/4194304 name=DT_AUTO_QUEUE_wifibre067@bebroadband target=192.168.10.204/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre058@bebroadband target=192.168.20.221/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre069@bebroadband target=192.168.20.236/32
add max-limit=10485760/10485760 name=DT_AUTO_QUEUE_wifibre102@bebroadband target=192.168.20.145/32
/queue type
add kind=pcq name="PCQ Download - KING H.S" pcq-burst-rate=220000000 pcq-burst-time=30s pcq-classifier=dst-address pcq-dst-address6-mask=64 pcq-rate=200000000 pcq-src-address6-mask=64 pcq-total-limit=40000
add kind=pcq name="PCQ Upload - KING H.S" pcq-burst-rate=220000000 pcq-burst-time=30s pcq-classifier=src-address pcq-dst-address6-mask=64 pcq-rate=200000000 pcq-src-address6-mask=64 pcq-total-limit=40000
/snmp community
add addresses=0.0.0.0/0 name=bebroadband
/system logging action
add bsd-syslog=true name=papertrail remote=169.46.82.166 remote-port=20269 target=remote
/ip firewall connection tracking
set generic-timeout=5m udp-stream-timeout=5m
/ip settings
set allow-fast-path=false icmp-rate-limit=300
/interface l2tp-server server
set default-profile=VPN enabled=true ipsec-secret=B3IPs#cPass!@3 use-ipsec= required
/interface pppoe-server server
add default-profile="Wi-Fibre PPP" disabled=false interface= "ether3 Jaco House" keepalive-timeout=120 one-session-per-host=true service-name="BeBroadband Wi-Fibre (Jaco Connection)"
add default-profile="Wi-Fibre PPP" disabled=false interface= "ether4-Denton to King PtP" keepalive-timeout=30 max-mtu=1480 service-name="BeBroadband Wi-Fibre (Denton Core)"
/interface pptp-server server
set authentication=pap,chap,mschap1,mschap2 default-profile="Wi-Fibre PPP"
/ip accounting
set enabled=true
/ip address
add address=192.168.88.1/24 disabled=true interface="ether3 Jaco House" network=192.168.88.0
add address=10.200.100.1/24 interface="ether4-Denton to King PtP" network= 10.200.100.0
add address=10.200.200.1/24 interface="ether4-Denton to King PtP" network= 10.200.200.0
add address=10.200.96.3/20 interface="ether4-Denton to King PtP" network= 10.200.96.0
add address=192.168.1.21/24 interface="ether4-Denton to King PtP" network= 192.168.1.0
/ip cloud
set ddns-enabled=true
/ip dhcp-server network
add address=10.20.20.0/24 dns-server=1.0.0.1,8.8.8.8 gateway=10.20.20.1
/ip dns
set servers=1.0.0.1,8.8.8.8
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
add action=add-src-to-address-list address-list=Torrent-Conn address-list-timeout=2m chain=forward disabled=true layer7-protocol= block-torrents src-address=192.168.10.0/24 src-address-list=!allow-bit
add action=drop chain=forward disabled=true dst-port= !0-1024,5900,5800,3389,14147,5222,59905 protocol=tcp src-address-list= Torrent-Conn
add action=drop chain=forward disabled=true dst-port= !0-1024,5900,5800,3389,14147,5222,59905 protocol=udp src-address-list= Torrent-Conn
add action=accept chain=input protocol=udp src-port=1812-1813
add action=accept chain=input protocol=udp src-port=1700-1701
add action=accept chain=input protocol=udp src-port=3799
/ip firewall mangle
add action=mark-connection chain=prerouting disabled=true new-connection-mark=PPP_DOWNLOAD passthrough=true src-address= 192.168.10.1-192.168.10.254
add action=mark-packet chain=prerouting connection-mark=PPP_DOWNLOAD disabled=true new-packet-mark=PPP_DOWNLOAD_PM passthrough=true
/ip firewall nat
add action=masquerade chain=srcnat
add action=dst-nat chain=dstnat dst-port=8444 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.96.24 to-ports=443
add action=dst-nat chain=dstnat dst-port=8446 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.96.26 to-ports=443
add action=dst-nat chain=dstnat dst-port=8165 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.43 to-ports=443
add action=dst-nat chain=dstnat dst-port=8185 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.44 to-ports=443
add action=dst-nat chain=dstnat dst-port=8001 protocol=tcp to-addresses= 10.200.96.5 to-ports=443
add action=dst-nat chain=dstnat dst-port=1002 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=192.168.1.3 to-ports=8282
/ip service
set telnet disabled=true
set ftp port=2121
set www disabled=true port=8888
set ssh disabled=true
set api port=8787
set winbox port=8282
set api-ssl disabled=true
/ip ssh
set allow-none-crypto=true forwarding-enabled=remote
/ip traffic-flow
set active-flow-timeout=5m cache-entries=2M enabled=true
/ppp aaa
set use-radius=true
/ppp secret
add disabled=true name=wifibre025@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre027@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre026@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre006@bebroadband password=W1F1bR300^ profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre002@bebroadband password=W1F1bR300@ profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre007@bebroadband password=W1F1bR300& profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre010@bebroadband password="W1F1bR30!)" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre008@bebroadband password=W1F1bR300* profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre004@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre009@bebroadband password="W1F1bR300(" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre014@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre013@bebroadband password=W1F1bR300# profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre015@bebroadband password=W1F1bR300# profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre016@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre017@bebroadband password=W1F1bR300% profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre018@bebroadband password=W1F1bR300^ profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre005@bebroadband password=W1F1bR300% profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre011@bebroadband password=W1F1bR300! profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre012@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre022@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre024@bebroadband password="W1F1bR300 $" profile= "Jaco Static IP" service=pppoe
add disabled=true name=wifibre021@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre019@bebroadband password=W1F1bR300* profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre028@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre001@bebroadband password=W1F1bR300! profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre003@bebroadband (Migrated to DT)" password= W1F1bR300# profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre023@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre029@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre020@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre030@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre031@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre032@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre033@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre034@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre035@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre036@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre037@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre039@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name="wifibre038@bebroadband (ACCOUNT SUSPENDED)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre040@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre041@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre042@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre043@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre044@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre045@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre046@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre047@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre048@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre049@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre050@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre051@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre052@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre053@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre054@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre055@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre056@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre057@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre058@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre059@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre060@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre061@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre062@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre063@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre064@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre065@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre066@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre067@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre068@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre069@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre070@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre071@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre072@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre073@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre074@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre075@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre076@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre077@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre078@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre079@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre080@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre081@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre082@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre083@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre085@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre086@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre084@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre087@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name="wifibre088@bebroadband (ACCOUNT SUSPENDED)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre089@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre090@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre091@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre092@bebroadband password="W1F1bR300 $" profile= "PhilipW Static IP" service=pppoe
add name=wifibre093@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre094@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre095@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre096@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre097@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre098@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre099@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre100@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre101@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre102@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre103@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre104@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre105@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre106@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre107@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre108@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre109@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre110@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre111@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre112@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre113@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre114@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre115@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre116@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre117@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre118@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre119@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre120@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre122@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre125@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre126@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre127@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre142@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre143@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre140@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre138@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre121@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre123@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre124@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre128@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre129@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre130@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre131@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre133@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre134@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre135@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre136@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre137@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre151@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre153@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre149@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre156@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre152@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre158@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre166@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre171@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre173@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre172@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre167@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre165@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre145@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre179@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre178@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre176@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre182@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre144@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre132@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre139@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre141@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre146@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre147@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre148@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre150@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre154@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre155@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre157@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre159@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre160@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre161@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre162@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre163@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre164@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre168@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre169@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre170@bebroadband (Migrated to DT)" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre174@bebroadband ACCOUNT SUSPENDED" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre175@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre177@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre180@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre181@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre183@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre184@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre185@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre186@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre187@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre188@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre189@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre190@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre191@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre192@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre193@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre195@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre194@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre196@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre197@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre198@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre199@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre200@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre201@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre202@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre203@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre204@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre205@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre206@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre207@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre208@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre209@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre210@bebroadband ACCOUNT SUSPENDED" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre211@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre212@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre213@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre214@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre215@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre216@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre217@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=philip.willemse password="Phillip!@#123 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre218@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre219@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre220@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre221@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre222@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre223@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre224@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre225@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre226@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre227@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre228@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre230@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre231@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre232@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre233@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre234@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre235@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre236@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre237@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre238@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre239@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre240@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre241@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre242@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre243@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre244@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=default@bebroadband password=P@ssword!@3 profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre245@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=philip.willemse password="Phillip!@#123 $" profile="Wi-Fibre PPP" service=l2tp
add disabled=true name=wifibre246@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre247@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre248@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre249@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre250@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre251@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre252@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre253@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre254@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre255@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre256@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre257@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre258@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre259@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre260@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre261@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre262@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre263@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre264@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre265@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre266@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre267@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre268@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre269@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre270@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre271@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre272@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre273@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre274@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre275@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre276@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre277@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre278@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre279@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre280@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre281@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre282@bebroadband (Customer Cancelled)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre283@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre284@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre285@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre286@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre287@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre288@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre289@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre290@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre291@bebroadband (Customer Cancelled)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre292@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre293@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre294@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre295@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre296@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre297@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre298@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre299@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre300@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre301@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre302@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre303@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre304@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre305@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre306@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre307@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre308@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre309@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre310@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre311@bebroadband ACCOUNT CANCELLED" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre312@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre313@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre314@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre315@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=AlbertonH.S@bebroadband password=P@ssword!@3 profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=access@bebroadband password=password!@3 profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre316@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre317@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre318@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre319@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre320@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre321@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre322@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre323@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre324@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre325@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre326@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre327@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre328@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre329@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre330@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre331@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre332@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre333@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre334@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre335@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre229@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre336@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre337@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre338@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre339@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre340@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre345@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre346@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre347@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre348@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre349@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre350@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre352@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre353@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre354@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre355@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre356@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre357@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre358@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre359@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre360@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre363@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre092V2@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre367@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre368@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre369@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre370@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre079V2@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibreV230@bebroadband password=P@ssword!@3 profile="Wi-Fibre PPP" service=pppoe
add name=wifibre385@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre386@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre382@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre394@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre395@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=KingH.S-Primary@bebroadband password=P@ssword!@3 profile= "Router Access (Primary) Static IP" service=pppoe
add name=paul.venter password="Paul!@#123 $" profile=VPN service=l2tp
add name=wifibre414@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre422@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre415@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre425@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre437@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=KingH.S-Failover@bebroadband password=P@ssword!@3 profile= "Router Access (Backup) Static IP" service=pppoe
add name=wifibre424@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre438@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre439@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre440@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre441@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre442@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre443@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre444@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre445@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre459@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre463@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre485@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre479@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre431@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre488@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre469@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre400@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre427@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre430@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre436@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre449@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre493@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=amith.gosai password=Am!th!@3 profile="Wi-Fibre PPP" service=l2tp
add name=wifibre505@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre506@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre512@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre518@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre519@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre523@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre525@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre528@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre530@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre516@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre510@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre533@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
/radius
add address=41.76.109.191 secret=B3Adm1nCor3!@3 service=ppp,login src-address=196.11.156.137
/radius incoming
set accept=true
/snmp
set contact=philipw@bebroadband.co.za enabled=true location="Denton Core" trap-community=bebroadband
/system clock
set time-zone-autodetect=false time-zone-name=Africa/Johannesburg
/system identity
set name="Denton Core"
/system logging
set 1 disabled=true
add topics=ppp,pppoe,info,account
add topics=radius
add action=papertrail topics=debug
add action=papertrail topics=!async
add topics=dns,!packet
