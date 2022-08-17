sudo apt -y install lsb-release apt-transport-https ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ bullseye main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt upgrade -y
sudo apt-get install php$1-{bcmath,bz2,intl,gd,mbstring,mysql,zip}
