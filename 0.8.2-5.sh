#!/bin/sh
sudo su
cd /home/ubuntu
sudo git clone https://github.com/n-y-z-o/nyzoVerifier.git
cd nyzoVerifier
sudo ./gradlew build
sudo mkdir -p /var/lib/nyzo/production
sudo cp trusted_entry_points /var/lib/nyzo/production
sudo cp nyzoVerifier.conf /etc/supervisor/conf.d
sudo bash -c 'echo Zillipa$RANDOM > /var/lib/nyzo/production/nickname'
sudo supervisorctl reload
sleep 2s
sudo renice -n -5 -p $(pgrep ^java$)
echo "@reboot sudo supervisorctl reload" >> mycron
sudo crontab mycron
rm mycron
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo supervisorctl status
more /var/lib/nyzo/production/verifier_private_seed
