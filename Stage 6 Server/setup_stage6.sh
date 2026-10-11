#!/bin/bash
# create the player's low-privilege account (login from Stage 5)
sudo useradd -m -s /bin/bash cvault
echo 'cvault:S3cr3tP@ss' | sudo chpasswd
# the final flag, readable only by root
echo 'CyberVault{r00t_0f_4ll_3v1l}' | sudo tee /root/root.txt
sudo chmod 600 /root/root.txt
# THE WEAKNESS: cvault may run "find" as root without a password
echo 'cvault ALL=(ALL) NOPASSWD: /usr/bin/find' | sudo tee /etc/sudoers.d/cvault
sudo chmod 440 /etc/sudoers.d/cvault
echo "Stage 6 is ready.