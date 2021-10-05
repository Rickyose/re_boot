#!/bin/bash

######################################################################################################
#### INI JANGAN DIGANTI, AGAR BISA MENJALANKAN VNCSERVER
sudo -u ubuntu vncserver
sleep 10
######################################################################################################
################## SCRIPT INI BOLEH DI MODIF
bash /home/ubuntu/start_mining.sh &
sleep 10




######################################################################################################
#### INI JANGAN DIGANTI, AGAR BISA AUTO REBOOT DAN MENJALANKAN SCRIPT
sleep 24h
sudo reboot
######################################################################################################
