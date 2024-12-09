#!/bin/bash

# Присвоение переменных
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
TIMEZONE="$TIMEZONE UTC $(date +"%:z" | sed 's/+0\([1-9]\):00/+\1/')"
USER=$(whoami)
OS="Unknown"
source /etc/os-release
OS=$PRETTY_NAME
DATE=$(date '+%d %b %Y %H:%M:%S')
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(hostname -I | awk '{print $1}')
#src % ifconfig | grep inet | awk 'NR == 1{print $2}'
MASK=$(ifconfig | grep ${IP} | awk '{print $4}')
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(grep -i 'memtotal' /proc/meminfo | awk '{printf ("%.3f", $2/1024/1024);}')
RAM_USED=$(free | grep "Mem:" | awk '{printf ("%.3f", $3/1024/1024);}')
RAM_FREE=$(free | grep "Mem:" | awk '{printf ("%.3f", $4/1024/1024);}')
SPACE_ROOT=$(df / | awk 'NR==2 {printf ("%.2f", $2/1024);}')
SPACE_ROOT_USED=$(df / | awk 'NR==2 {printf ("%.2f", $3/1024);}')
SPACE_ROOT_FREE=$(df / | awk 'NR==2 {printf ("%.2f", $4/1024);}')

# Вывод параметров
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL GB"
echo "RAM_USED = $RAM_USED GB"
echo "RAM_FREE = $RAM_FREE GB"
echo "SPACE_ROOT = $SPACE_ROOT MB"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"

read -p "Save info to file? (Y/N) " choice

if [[ $choice =~ ^[Yy]$ ]]; then
    FILE="$(date '+%d %b %Y %H:%M:%S').system"
    {
        echo "HOSTNAME = $HOSTNAME"
        echo "TIMEZONE = $TIMEZONE"
        echo "USER = $USER"
        echo "OS = $OS"
        echo "DATE = $DATE"
        echo "UPTIME = $UPTIME"
        echo "UPTIME_SEC = $UPTIME_SEC"
        echo "IP = $IP"
        echo "MASK = $MASK"
        echo "GATEWAY = $GATEWAY"
        echo "RAM_TOTAL = $RAM_TOTAL GB"
        echo "RAM_USED = $RAM_USED GB"
        echo "RAM_FREE = $RAM_FREE GB"
        echo "SPACE_ROOT = $SPACE_ROOT MB"
        echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
        echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"
    }> "${FILE}"
    echo "Saved in to "${FILE}""
else
    echo "Info didn't save"
fi