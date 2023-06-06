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

######################################################################################################
#### INI JANGAN DIGANTI, AGAR BISA AUTO REBOOT DAN MENJALANKAN SCRIPT
#sleep 24h
#sudo reboot
######################################################################################################
