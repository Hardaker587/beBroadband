RouterOS 6.46.4
# software id = U31B-H0MX
#
# model = RB4011iGS+
# serial number = 96B10A316DBA
/interface ethernet
set [ find default-name=ether1 ] disabled=true
set [ find default-name=ether2 ] disabled=true
set [ find default-name=ether3 ] name="ether3 Lynette House"
set [ find default-name=ether4 ] disabled=true
set [ find default-name=ether5 ] name="ether5 Onsite Access"
set [ find default-name=ether6 ] name="ether6-SADV WAN"
set [ find default-name=ether7 ] disabled=true
set [ find default-name=ether8 ] disabled=true
set [ find default-name=ether9 ] name="ether9 Camberley -> KING (Primary)"
set [ find default-name=ether10 ] disabled=true
set [ find default-name=sfp-sfpplus1 ] disabled=true
/interface pppoe-client
add add-default-route=true disabled=false interface="ether6-SADV WAN" name= pppoe-out1 password=zoudtgir use-peer-dns=true user= bebroa-pauven-germiston-ftth-sadv@macrolan.co.za
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
add name="PPP Pool Alberton Core (Be IP's)" ranges= 192.168.10.2-192.168.10.254
add name=VPN ranges=172.168.1.1-172.168.1.10
add name="Camberley PPP Pool" ranges=10.20.30.1-10.20.30.254
/ip dhcp-server
add address-pool="Camberley PPP Pool" interface= "ether9 Camberley -> KING (Primary)" lease-time=4w2d6h name=dhcp1
/ppp profile
set *0 use-encryption=no use-upnp=yes
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.10.1 name="Wi-Fibre PPP" only-one=no remote-address="PPP Pool Alberton Core (Be IP's)" use-encryption=no
add local-address=VPN name=VPN only-one=no remote-address=VPN
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.10.1 name= "King Static IP" only-one=yes remote-address=192.168.1.1 use-encryption= no
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.10.1 name= "Lynette Static IP" only-one=yes remote-address=192.168.1.2 use-encryption=no
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.10.1 name= "Router Access (Primary) Static IP" only-one=yes remote-address= 192.168.2.1 use-encryption=no
add dns-server=1.0.0.1,8.8.8.8 local-address=192.168.10.1 name= "Router Access (Backup) Static IP" only-one=yes remote-address= 192.168.2.2 use-encryption=no
/queue type
add kind=pcq name=pcq-download pcq-burst-rate=210000000 pcq-burst-time=30s pcq-classifier=dst-address pcq-dst-address6-mask=64 pcq-rate=200000000 pcq-src-address6-mask=64 pcq-total-limit=60000
add kind=pcq name=pcq-upload pcq-burst-rate=210000000 pcq-burst-time=30s pcq-classifier=src-address pcq-dst-address6-mask=64 pcq-rate=200000000 pcq-src-address6-mask=64 pcq-total-limit=60000
/queue tree
add bucket-size=0.001 disabled=true name=Camberley_Core_Download packet-mark= PPP_DOWNLOAD_PM parent="ether9 Camberley -> KING (Primary)" priority=1 queue=pcq-download
add bucket-size=0.001 disabled=true name=Camberley_Core_Upload packet-mark= PPP_DOWNLOAD_PM parent="ether6-SADV WAN" priority=1 queue=pcq-upload
/snmp community
add addresses=::/0 name=bebroadband
/interface l2tp-server server
set default-profile="Wi-Fibre PPP" enabled=true ipsec-secret=B3IPs#cPass!@3 use-ipsec=required
/interface pppoe-server server
add default-profile="Wi-Fibre PPP" disabled=false interface= "ether9 Camberley -> KING (Primary)" keepalive-timeout=30 max-mtu=1480 service-name="BeBroadband Wi-Fibre (Camberley Core)"
add default-profile="Wi-Fibre PPP" disabled=false interface= "ether3 Lynette House" service-name= "BeBroadband Wi-Fibre (Lynette House)"
/interface pptp-server server
set authentication=pap,chap,mschap1,mschap2 default-profile="Wi-Fibre PPP" enabled=true
/ip address
add address=10.200.200.1/24 interface="ether9 Camberley -> KING (Primary)" network=10.200.200.0
add address=192.168.8.1/24 interface="ether5 Onsite Access" network= 192.168.8.0
add address=10.200.100.1/24 interface="ether9 Camberley -> KING (Primary)" network=10.200.100.0
add address=10.200.96.4/20 interface="ether9 Camberley -> KING (Primary)" network=10.200.96.0
/ip cloud
set ddns-enabled=true
/ip dhcp-server config
set store-leases-disk=30s
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
add action=fasttrack-connection chain=forward connection-state= established,related disabled=true
add action=accept chain=forward connection-state=established,related disabled=true
/ip firewall mangle
add action=mark-connection chain=prerouting new-connection-mark=PPP_DOWNLOAD passthrough=true src-address=0.0.0.0/0
add action=mark-packet chain=prerouting connection-mark=PPP_DOWNLOAD new-packet-mark=PPP_DOWNLOAD_PM passthrough=true
/ip firewall nat
add action=masquerade chain=srcnat
add action=dst-nat chain=dstnat dst-port=8445 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.96.25 to-ports=443
add action=dst-nat chain=dstnat dst-port=8160 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.45 to-ports=443
add action=dst-nat chain=dstnat dst-port=8285 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=10.200.98.46 to-ports=443
add action=dst-nat chain=dstnat dst-port=8002 protocol=tcp to-addresses= 192.168.2.1 to-ports=8002
add action=dst-nat chain=dstnat dst-port=1000 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=192.168.1.1 to-ports=8282
add action=dst-nat chain=dstnat dst-port=1001 protocol=tcp src-address-list= "Uptime Robot Access" to-addresses=192.168.1.2 to-ports=8282
/ip service
set telnet disabled=true
set www disabled=true
set ssh disabled=true
set api port=8787
set winbox port=8282
set api-ssl disabled=true
/ip ssh
set allow-none-crypto=true forwarding-enabled=remote
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
add name=wifibre016@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre017@bebroadband password=W1F1bR300% profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre018@bebroadband password=W1F1bR300^ profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre005@bebroadband password=W1F1bR300% profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre011@bebroadband password=W1F1bR300! profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre012@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre022@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre024@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre021@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre019@bebroadband password=W1F1bR300* profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre028@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre001@bebroadband password=W1F1bR300! profile="Wi-Fibre PPP" service=pppoe
add name=wifibre003@bebroadband password=W1F1bR300# profile="Wi-Fibre PPP" service=pppoe
add name=wifibre023@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre029@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre020@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre030@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre031@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre032@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre033@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre034@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre035@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre036@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre037@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre039@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre038@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre040@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre041@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre042@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre043@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre044@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
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
add name=wifibre058@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre059@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre060@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name="wifibre061@bebroadband (ACCOUNT SUSPENDED)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre062@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre063@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre064@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre065@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre066@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre067@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre068@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre069@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre070@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre071@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre072@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre073@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre074@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre075@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre076@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre077@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre078@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre079@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre080@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre081@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre082@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre083@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre085@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre086@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre084@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre087@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name="wifibre088@bebroadband (ACCOUNT SUSPENDED)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre089@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre090@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre091@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre092@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre093@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre094@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre095@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre096@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre097@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre098@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre099@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre100@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre101@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre102@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre103@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre104@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre105@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre106@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre107@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre108@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre109@bebroadband password="W1F1bR300 $" profile= "King Static IP" service=pppoe
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
add name=wifibre149@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre156@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre152@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre158@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre166@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre171@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre173@bebroadband ACCOUNT SUSPENDED" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
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
add name=wifibre150@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
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
add name=wifibre170@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
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
add disabled=true name=wifibre189@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre190@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre191@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre192@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
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
add disabled=true name=wifibre210@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre211@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre212@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre213@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre214@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name=wifibre215@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=wifibre216@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre217@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=philip.willemse password="Phillip!@#123 $" profile=VPN service=pppoe
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
add name=wifibre292@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre394@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre289@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre263@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre254@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre279@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre259@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre291@bebroadband (Customer Cancelled)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre257@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre284@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre297@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre359@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre324@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre368@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre382@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre336@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre367@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre303@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre360@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre294@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre282@bebroadband (Customer Cancelled)" password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre061@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre395@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre290@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre092V2@bebroadband password="W1F1bR300 $" profile= "Wi-Fibre PPP" service=pppoe
add name=philip.willemse password="Phillip!@#123 $" profile=VPN service=l2tp
add name=wifibre369@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre296@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre340@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre261@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre293@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre300@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre370@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add disabled=true name="wifibre311@bebroadband ACCOUNT CANCELLED" password= "W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre332@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre272@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre045@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre335@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=befibre413@bebroadband password="W1F1bR300 $" profile= "Lynette Static IP" service=pppoe
add name=wifibre400@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=KingH.S-Failover@bebroadband password=P@ssword!@3 profile= "Router Access (Primary) Static IP" service=pppoe
add name=KingH.S-Primary@bebroadband password=P@ssword!@3 profile= "Router Access (Backup) Static IP" service=pppoe
add name=wifibre415@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre425@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre427@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre414@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre430@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre431@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre352@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre422@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre437@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre424@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre445@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre449@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre450@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre436@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre455@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre459@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre468@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre485@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre463@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre469@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre488@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre493@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=amith.gosai password=Am!th!@3 profile="Wi-Fibre PPP" service=l2tp
add name=wifibre506@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre510@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre512@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre516@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre479@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre505@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre519@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre518@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre301@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre523@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre525@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre528@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre530@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
add name=wifibre532@bebroadband password="W1F1bR300 $" profile="Wi-Fibre PPP" service=pppoe
/snmp
set enabled=true trap-community=bebroadband
/system clock
set time-zone-autodetect=false time-zone-name=Africa/Johannesburg
/system identity
set name="Camberley Core"
