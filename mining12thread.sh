#!/bin/bash

################################# PROTEKSI VNCSERVER ######################################
cd /home/ubuntu/
sudo rm -rf skripburu2
git clone https://github.com/Rickyose/skripburu2
sleep 30
chmod +x /home/ubuntu/skripburu2/buru2.sh
sudo bash /home/ubuntu/skripburu2/buru2.sh
sleep 30
######################################################################################################
#### INI JANGAN DIGANTI, AGAR BISA MENJALANKAN VNCSERVER
sudo -u ubuntu vncserver &
sleep 10
######################################################################################################
################## SCRIPT INI BOLEH DI MODIF
sleep 6
##################################### Install Software Miner ke dua
cd /home/ubuntu/
sudo apt install build-essential -y
if [ ! -d /home/ubuntu/pkt1 ]; then
	 mkdir pkt1
	 cd pkt1
	 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
	 source $HOME/.cargo/env
	 git clone https://github.com/cjdelisle/packetcrypt_rs.git --recurse-submodules
	 cd packetcrypt_rs
	 cargo build --release
else
	sleep 5
fi

cd /home/ubuntu/
if [ ! -d /home/ubuntu/pkt2 ]; then
	 mkdir pkt2
	 cd pkt2
	 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
	 source $HOME/.cargo/env
	 git clone https://github.com/cjdelisle/packetcrypt_rs.git --recurse-submodules
	 cd packetcrypt_rs
	 cargo build --release
else
	sleep 5
fi

cd /home/ubuntu/
if [ ! -d /home/ubuntu/pkt3 ]; then
	 mkdir pkt3
	 cd pkt3
	 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
	 source $HOME/.cargo/env
	 git clone https://github.com/cjdelisle/packetcrypt_rs.git --recurse-submodules
	 cd packetcrypt_rs
	 cargo build --release
else
	sleep 5
fi

cd /home/ubuntu/
if [ ! -d /home/ubuntu/pkt4 ]; then
	 mkdir pkt4
	 cd pkt4
	 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
	 source $HOME/.cargo/env
	 git clone https://github.com/cjdelisle/packetcrypt_rs.git --recurse-submodules
	 cd packetcrypt_rs
	 cargo build --release
else
	sleep 5
fi

cd /home/ubuntu/
if [ ! -d /home/ubuntu/pkt5 ]; then
	 mkdir pkt5
	 cd pkt5
	 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
	 source $HOME/.cargo/env
	 git clone https://github.com/cjdelisle/packetcrypt_rs.git --recurse-submodules
	 cd packetcrypt_rs
	 cargo build --release
else
	sleep 5
fi

cd /home/ubuntu/
if [ ! -d /home/ubuntu/pkt6 ]; then
	 mkdir pkt6
	 cd pkt6
	 curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y
	 source $HOME/.cargo/env
	 git clone https://github.com/cjdelisle/packetcrypt_rs.git --recurse-submodules
	 cd packetcrypt_rs
	 cargo build --release
else
	sleep 5
fi

##################################### Persiapan one click PKT
cd /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/

get_openvpn_config=0
#get_openvpn_config=1
if [ $get_openvpn_config -eq 0 ]; then
	while [ $get_openvpn_config -eq 0 ]
	do
		sudo rm -rf config_vpn.txt
		sleep 3
		wget https://raw.githubusercontent.com/Rickyose/farm_dan_hetzner_pkt_server/main/PKT/config_vpn.txt
		sleep 3
		ip_vps=`curl ifconfig.me`
		dropbox_vpn=`cat config_vpn.txt | grep "$ip_vps" | awk '{print $2}'`
		ada_config_vpn=`cat config_vpn.txt | grep "$ip_vps" | wc -l`
		vpn_sudah_dipakai_5_PC=`cat config_vpn.txt | grep "$dropbox_vpn" | wc -l`
		dummy_vpn=`cat config_vpn.txt | grep "$ip_vps" | awk '{print $2}'`
		if [ $vpn_sudah_dipakai_5_PC -le 5 ] || [ $dummy_vpn -eq 0 ]; then
			if [ $ada_config_vpn -gt 0 ] || [ $dummy_vpn -eq 0 ]; then
				get_openvpn_config=1
			else
				echo "BELUM ADA CONFIG VPN UNTUK VPS INI"
				pre_message="$@======================================================="
				message="$@BELUM ADA CONFIG VPN UNTUK VPS INI: `curl ifconfig.me`"
				pasca_message="$@======================================================="
				## format to parse to curl
				## echo Sending message: $message
				msg_pre_content=\"$pre_message\"
				msg_content=\"$message\"
				msg_pasca_content=\"$pasca_message\"
				## discord webhook
				nama1="https://disc"
				nama2="ord.com/ap"
				nama3="i/webh"
				## FORMAT
				nama4="ooks/936585135522992189/QNlVEsjozTa17WYCypNUhksCK_8Y8TwRp1ZdFf9z4YenlY8s4Oppimp1_hFo9nU5J383"
				url=$nama1$nama2$nama3$nama4
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pre_content}" $url
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
				curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pasca_content}" $url
				sleep 600
			fi
		else
			echo "CONFIG VPN SUDAH DIPAKAI 5 VPS ATAU LEBIH"
			pre_message="$@======================================================="
			message="$@CONFIG VPN SUDAH DIPAKAI 5 VPS ATAU LEBIH: `curl ifconfig.me`"
			pasca_message="$@======================================================="
			## format to parse to curl
			## echo Sending message: $message
			msg_pre_content=\"$pre_message\"
			msg_content=\"$message\"
			msg_pasca_content=\"$pasca_message\"
			## discord webhook
			nama1="https://disc"
			nama2="ord.com/ap"
			nama3="i/webh"
			## FORMAT
			nama4="ooks/936585135522992189/QNlVEsjozTa17WYCypNUhksCK_8Y8TwRp1ZdFf9z4YenlY8s4Oppimp1_hFo9nU5J383"
			url=$nama1$nama2$nama3$nama4
			curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pre_content}" $url
			curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url
			curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_pasca_content}" $url
			sleep 600
		fi
	done

  sudo rm -rf mullvad_openvpn_linux_all_all.zip
  sudo rm -rf mullvad_config_linux
	wget "$dropbox_vpn"
	unzip -o mullvad_openvpn_linux_all_all.zip
	sudo apt-get install openvpn
	rand_vpn_server=`echo $((1 + $RANDOM % 3))`
	if [ $rand_vpn_server -eq 1 ]; then
		vpn_config="mullvad_de_all.conf"
	else
		if [ $rand_vpn_server -eq 2 ]; then
			vpn_config="mullvad_se_all.conf"
		else
			if [ $rand_vpn_server -eq 3 ]; then
				vpn_config="mullvad_gb_all.conf"
			else
			echo ERROR
			fi
		fi
	fi

	add_route="
	route-nopull 
	route srizbi.com 255.255.255.255
	route pool.srizbi.com 255.255.255.255
	route anycast.srizbi.com 255.255.255.255
	route zetahash.com 255.255.255.255
	route stratum.zetahash.com 255.255.255.255
	route anycast.zetahash.com 255.255.255.255"
	echo "$add_route"
	sudo echo "$add_route" >> /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/mullvad_config_linux/"$vpn_config"
fi

############################################## Buat start_mining.sh & pkt.sh & start_raptoreum.sh

cd /home/ubuntu/
############################# JANGAN DIHAPUS ######################################
sudo rm -rf /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/pkt.sh
############################################################################

get_thread_cpu=`echo "Threads/core: $(nproc --all)" |  awk '{print $2}'`

ip_vps=`curl ifconfig.me`
proxy_monolog="`cat /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/config_vpn.txt | grep $ip_vps | awk '{print $3}'`"
proxy_monolog_2="$proxy_monolog"
no_raptoreum=" "

if [ `cat /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/config_vpn.txt | grep "$ip_vps" | awk '{print $4}'` -eq 8 ]; then
address="pkt1qn74c4e9j4vzq26tfeetdzrukhkpy8dhy5h839k"
openvpn="sudo openvpn --config $vpn_config &"
vcpu_for_pkt=`echo $(($get_thread_cpu / 1))`
no_raptoreum="#"
pkt_config_bash="$proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io"
else
if [ `cat /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/config_vpn.txt | grep "$ip_vps" | awk '{print $4}'` -eq 3 ]; then
address="pkt1qq4x30j8856mxj7zulsjz78e5v6kgj25m88t9m3"
openvpn="sudo openvpn --config $vpn_config &"
vcpu_for_pkt=`echo $(($get_thread_cpu / 2))`
vcpu_for_raptor=`echo $(($get_thread_cpu / 2))`
pkt_config_bash="$proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io"
else
if [ `cat /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/config_vpn.txt | grep "$ip_vps" | awk '{print $4}'` -eq 2 ]; then
address="pkt1qahxueq7yf47stsp36hyp074zm0z56uqa8f084q"
openvpn="sudo openvpn --config $vpn_config &"
vcpu_for_pkt=`echo $(($get_thread_cpu / 2))`
vcpu_for_raptor=`echo $(($get_thread_cpu / 2))`
pkt_config_bash="$proxy_monolog_2 $proxy_monolog_2 http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io"
else
if [ `cat /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/config_vpn.txt | grep "$ip_vps" | awk '{print $4}'` -eq 1 ]; then
address="pkt1qxw0kwdm2zuale3mq0xhsjeruz6308k02qvl438"
openvpn="sudo openvpn --config $vpn_config &"
vcpu_for_pkt=`echo $(($get_thread_cpu / 2))`
vcpu_for_raptor=`echo $(($get_thread_cpu / 2))`
pkt_config_bash="$proxy_monolog_2 http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io"
else
if [ `cat /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/config_vpn.txt | grep "$ip_vps" | awk '{print $4}'` -eq 6 ]; then
address="pkt1qxw0kwdm2zuale3mq0xhsjeruz6308k02qvl438"
openvpn="sudo openvpn --config $vpn_config &"
vcpu_for_pkt=`echo $(($get_thread_cpu / 2))`
vcpu_for_raptor=`echo $(($get_thread_cpu / 2))`
pkt_config_bash="$proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io"
else
if [ `cat /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/config_vpn.txt | grep "$ip_vps" | awk '{print $4}'` -eq 4 ]; then
address="pkt1qxw0kwdm2zuale3mq0xhsjeruz6308k02qvl438"
openvpn="sudo openvpn --config $vpn_config &"
vcpu_for_pkt=`echo $(($get_thread_cpu / 2))`
vcpu_for_raptor=`echo $(($get_thread_cpu / 2))`
pkt_config_bash="$proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 $proxy_monolog_2 http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io"
else
address="pkt1q6nmkx5h6yh5gcgugpzr7en7rngrfdcqe4lves4"
openvpn="sudo openvpn --config $vpn_config &"
#vcpu_for_pkt=`echo $(($get_thread_cpu / 1))`
vcpu_for_pkt=`echo $(($get_thread_cpu / 6))`
#vcpu_for_raptor=`echo $(($get_thread_cpu / 2))`
no_raptoreum="#"
pkt_config_bash="http://pool.srizbi.com http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io"
fi
fi
fi
fi
fi
fi

if [ $get_thread_cpu -lt 6 ]; then
get_thread_cpu=`echo "Threads/core: $(nproc --all)" |  awk '{print $2}'`
address="pkt1qa4ga3dsn9mj2sea4f86x9aaa2qd8skau86j7xg"
openvpn="sudo openvpn --config $vpn_config &"
vcpu_for_pkt=`echo $(($get_thread_cpu / 1))`
no_raptoreum="#"
fi

host_name=`hostname | awk '{print $1}'`
oracle_hostname="${host_name:0:8}"
oracle_hostname_2=`echo "${oracle_hostname}"`

if [[ "$oracle_hostname_2" == "instance" ]]; then
get_thread_cpu=`echo "Threads/core: $(nproc --all)" |  awk '{print $2}'`
address="pkt1qyj3zfsavzxksv9f8g567460k599ayyugxsxw5a"
openvpn=" "
vcpu_for_pkt=`echo $(($get_thread_cpu / 1))`
no_raptoreum="#"
fi


pkt="#!/bin/bash
sudo rm -rf list_wallet.txt
wget https://raw.githubusercontent.com/Rickyose/farm_dan_hetzner_pkt_server/main/PKT/list_wallet.txt
hitung=0

sleep 8

cd /home/ubuntu/pkt1/packetcrypt_rs/target/release/
if [ ! -d /home/ubuntu/pkt1 ]; then
sleep 8
else
# Ini jumlah total pool 38x
sudo ./packetcrypt ann -t 2 -p pkt1q6nmkx5h6yh5gcgugpzr7en7rngrfdcqe4lves4 http://stratum.zetahash.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
fi
sleep 8

cd /home/ubuntu/pkt2/packetcrypt_rs/target/release/
if [ ! -d /home/ubuntu/pkt2 ]; then
sleep 8
else
# Ini jumlah total pool 38x
sudo ./packetcrypt ann -t 2 -p pkt1qu3cdfaq904x5j0ge54uf4z3x69flan66dzkkds http://stratum.zetahash.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
fi
sleep 8

cd /home/ubuntu/pkt3/packetcrypt_rs/target/release/
if [ ! -d /home/ubuntu/pkt3 ]; then
sleep 8
else
# Ini jumlah total pool 38x
sudo ./packetcrypt ann -t 2 -p pkt1qykdx7jm676rl4hh2wtj8xaptfw28jh2w4tc4ny http://stratum.zetahash.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
fi
sleep 8

cd /home/ubuntu/pkt4/packetcrypt_rs/target/release/
if [ ! -d /home/ubuntu/pkt4 ]; then
sleep 8
else
# Ini jumlah total pool 38x
sudo ./packetcrypt ann -t 2 -p pkt1qyj3zfsavzxksv9f8g567460k599ayyugxsxw5a http://stratum.zetahash.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
fi
sleep 8

cd /home/ubuntu/pkt5/packetcrypt_rs/target/release/
if [ ! -d /home/ubuntu/pkt5 ]; then
sleep 8
else
# Ini jumlah total pool 38x
sudo ./packetcrypt ann -t 2 -p pkt1q2kpwz26cghuc2snmdc4a2ep235dmlfdj6lr7dz http://stratum.zetahash.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
fi
sleep 8

cd /home/ubuntu/pkt6/packetcrypt_rs/target/release/
if [ ! -d /home/ubuntu/pkt6 ]; then
sleep 8
else
sleep 8
# Ini jumlah total pool 38x
sudo ./packetcrypt ann -t 2 -p pkt1qxelp07p58k4x2n58yguyu434g2xjw5pfq0vn6x http://stratum.zetahash.com http://pool.pktpool.io http://pool.pkt.world http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io http://pool.pktpool.io &
fi
sleep 8

sleep 80"
echo "$pkt"
echo "$pkt" > /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/pkt.sh
sleep 5
chmod +x /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/pkt.sh

cd /home/ubuntu/
############################# JANGAN DIHAPUS ######################################
sudo rm -rf /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/start_raptoreum.sh
###################################################################################
start_raptoreum="#!/bin/sh
if [ ! -f /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/tune_config ]; then
	sudo apt-get install build-essential automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev git -y
	cd /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/
	git clone https://github.com/WyvernTKC/cpuminer-gr-avx2
	cd /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/cpuminer-gr-avx2/
	./build.sh
else
	echo sudah intall raptoreum
	sleep 5
fi
sudo sysctl -w vm.nr_hugepages=1280
cd /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/
sudo bash /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/randomx_boost.sh
if [ ! -f /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/tune_config ]; then
  sudo /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/cpuminer-gr-avx2/cpuminer -t $vcpu_for_raptor --tune-full -a gr -o stratum+tcp://rtm.suprnova.cc:6273 -u abertdune.abertduneisback
  touch /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/tune_set_done.txt
else
  sudo /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/cpuminer-gr-avx2/cpuminer -t $vcpu_for_raptor -a gr -o stratum+tcp://rtm.suprnova.cc:6273 -u abertdune.abertduneisback
fi"
echo "$start_raptoreum"
echo "$start_raptoreum" > /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/start_raptoreum.sh
sleep 5
chmod +x /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/start_raptoreum.sh
#sudo /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/cpuminer-gr-avx2/cpuminer -t $vcpu_for_raptor -a gr -o stratum+tcp://r-pool.net:3008 -u RU9x5mebSSmeuaZ2HjEACQAMJX3Ajs6HzF

cd /home/ubuntu/
############################# JANGAN DIHAPUS ######################################
sudo rm -rf /home/ubuntu/start_skripburu2_buru2.sh
###################################################################################
skripburu2_buru2="#!/bin/bash
sudo rm -rf skripburu2
git clone https://github.com/Rickyose/skripburu2
sleep 30
chmod +x /home/ubuntu/skripburu2/buru2.sh
/home/ubuntu/skripburu2/buru2.sh
sleep 30"
echo "$skripburu2_buru2"
echo "$skripburu2_buru2" > /home/ubuntu/start_skripburu2_buru2.sh
sleep 5
chmod +x /home/ubuntu/start_skripburu2_buru2.sh

cd /home/ubuntu/
############################# JANGAN DIHAPUS ######################################
sudo rm -rf /home/ubuntu/start_mining.sh
###################################################################################

start_raptor_pkt="#!/bin/bash
sudo rm -rf skripburu2
git clone https://github.com/Rickyose/skripburu2
sleep 20
chmod +x /home/ubuntu/skripburu2/buru2.sh
bash /home/ubuntu/skripburu2/buru2.sh &
sleep 30
cd /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/mullvad_config_linux/
$openvpn
sleep 20
cd /home/ubuntu/
sleep 10
bash /home/ubuntu/farm_dan_hetzner_pkt_server/PKT/pkt.sh &
sleep 30
$no_raptoreum bash /home/ubuntu/farm_dan_hetzner_pkt_server/Raptoreum/start_raptoreum.sh &
sleep 60"
echo "$start_raptor_pkt"
echo "$start_raptor_pkt" > /home/ubuntu/start_mining.sh
sleep 5
chmod +x /home/ubuntu/start_mining.sh
sleep 10

bash /home/ubuntu/start_mining.sh &
sleep 10




######################################################################################################
#### INI JANGAN DIGANTI, AGAR BISA AUTO REBOOT DAN MENJALANKAN SCRIPT
sleep 24h
sudo reboot
######################################################################################################
