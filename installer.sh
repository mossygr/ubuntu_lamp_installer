#!/bin/bash


### check if the program is run as root

apt-get -y update && apt-get -y upgrade
apt-get -y install apt-utils software-properties-common


###apache installing 
echo -e "\e[36mInstalling apache.....\e[0m"
apt-get -y install apache2 &>/dev/null >> log.txt
apache2 -v  &>/dev/null

if [ $? -eq 0 ]; then 
    echo -e "\e[34mApache installed succefully\e[0m"
    sleep 2;
else 
    echo -e "\e[31mERROR: Failed to install apache check\e[0m" 
    exit 1 
fi

## mysql installing 
echo -e "\e[36mInstalling mysql.....\e[0m"
apt-get -y install mysql-server &>/dev/null >> log.txt
mysql -V &>/dev/null

if [ $? -eq 0 ]; then
    echo -e "\e[34mMysql Installed Successfully\e[0m"
    sleep 2;
else
    echo -e "\e[31mERROR: Failed to install mysql check\e[0m"
    exit 1
fi


##installing php7
echo -e 'during the installation you will be promped to enter data'
sleep 3
echo -e "\e[36mInstalling php.....\e[0m"
#add-apt-repository -y ppa:ondrej/php 
apt-get -y install php php-mysql

php -v &>/dev/null

if [ $? -eq 0 ]; then
    echo -e "\e[34mPHP Installed Successfully\e[0m"
    sleep 1;
else
    echo -e "\e[31mERROR: Failed to install mysql check\e[0m"
    exit 1
fi


echo "Start the services."

service apache2 restart &>/dev/null >> log.txt

if [ $? -eq 0 ]; then
    echo -e "\e[34mApache  running \e[0m"
    sleep 1;
else
    echo -e "\e[31mERROR: Failed to start Apache check logs\e[0m"
    exit 1
fi


service mysql restart &>/dev/null >> log.txt

if [ $? -eq 0 ]; then
    echo -e "\e[34mmysql running \e[0m"
    sleep 1;
else
    echo -e "\e[31mERROR: Failed to start mysql check logs\e[0m"
    exit 1
fi

