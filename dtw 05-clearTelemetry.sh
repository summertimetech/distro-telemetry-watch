#! /bin/bash

# Author www.summertime.tech (2021)
# Version Ubuntu 
# Also useable for Linux Mint 20.2 - which is an Ubuntu derivate thus mostly similar
# Any new distro release can introduce new telemetry, to be sure: 
# Check with www.safing.io using download application Portmaster all outgoing traffic

echo Clear Telemetry!
# read answer

echo Apport - clearing
sudo systemctl stop apport.service
sudo systemctl disable apport.service
sudo systemctl mask apport.service
sudo apt remove apport
sudo apt purge apport
sudo apt-mark hold apport

echo Avahi - clearing
sudo systemctl stop avahi-daemon
sudo systemctl stop avahi-daemon.socket
sudo systemctl disable avahi-daemon
sudo systemctl disable avahi-daemon.socket
sudo apt remove avahi-utils
sudo apt purge avahi-utils
sudo systemctl mask avahi-daemon
sudo systemctl mask avahi-daemon.socket
sudo apt-mark hold avahi-utils

echo Colord - clearing
sudo systemctl stop colord.service
sudo systemctl disable colord-service
sudo systemctl mask colord.service
sudo apt remove colord
sudo apt purge colord
sudo apt-mark hold colord

echo cups browsed - clearing
sudo systemctl stop cups-browsed
sudo systemctl disable cups-browsed
sudo systemctl mask cups-browsed
sudo apt remove cups-browsed
sudo apt purge cups-browsed
sudo apt-mark hold cups-browsed

echo Snapd & snap - clearing
sudo systemctl stop snapd.service
sudo systemctl stop snapd.socket 
sudo systemctl stop snapd.seeded.service
sudo systemctl stop snapd.autoimport.service
sudo systemctl stop snapd.apparmor.service
sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket 
sudo systemctl disable snapd.seeded.service
sudo systemctl disable snapd.autoimport.service
sudo systemctl disable snapd.apparmor.service
sudo systemctl mask snapd.service
sudo systemctl mask snapd.socket 
sudo systemctl mask snapd.seeded.service
sudo systemctl mask snapd.autoimport.service
sudo systemctl mask snapd.apparmor.service
sudo apt remove snapd
sudo apt purge snapd
sudo apt-mark hold snap

echo Whoopsie - clearing
sudo systemctl stop whoopsie
sudo systemctl disable whoopsie
sudo systemctl mask whoopsie
sudo apt remove whoopsie
sudo apt purge whoopsie
sudo apt-mark hold whoopsie

echo xbrlapi - clearing
sudo apt remove xbrlapi
sudo apt purge xbrlapi
sudo apt-mark hold xbrlapi

echo popularity-contest - clearing
sudo apt remove popularity-contest 
sudo apt purge popularity-contest
sudo apt-mark hold popularity-contest
sudo rm /etc/cron.daily/popularity-contest

echo Http unattended upgrades - clearing
sudo systemctl stop apt-daily-upgrade.timer
sudo systemctl stop apt-daily.timer 
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily.timer
sudo apt remove unattended-upgrades
sudo apt purge unattended-upgrades
sudo apt-mark hold unattended-upgrades
sudo systemctl mask apt-daily-upgrade.timer
sudo systemctl mask apt-daily.timer

echo daily auto update parameter - clearing
text='APT::Periodic::Update-Package-Lists "0";'
sudo rm /etc/apt/apt.conf.d/10periodic
sudo touch /etc/apt/apt.conf.d/10periodic
sudo echo $text | sudo tee -a /etc/apt/apt.conf.d/10periodic >/dev/null

exit
