#!/bin/bash

if
    [[ $# -ne 4 ]]; then
    echo "Error"
    exit 1
fi

allThreads="1 2 3 4 5 6"
if [[ ! $allThreads =~ $1 || ! $allThreads =~ $2 || ! $allThreads =~ $3 || ! $allThreads =~ $4 ]]; then
    echo "Error: invalid parameters. Valid parameters are: 1, 2, 3, 4, 5, 6."
    exit 1
fi

if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
    echo "Error: background color and font color for one column must be different."
    echo "Rerun the script with valid colors."
    echo "-----------------------------"
    echo "Available colors:"
    echo "1 - white"
    echo "2 - red"
    echo "3 - green"
    echo "4 - blue"
    echo "5 - purple"
    echo "6 - black"
    echo "-----------------------------"
    echo "Pattern to run: main.sh <bg_color1> <font_color1> <bg_color2> <font_color2>"
    exit 1
fi

# Сброс цвета
close="\e[0m"

# Цветовые гаммы отличаются на фронте и беке
color=(97 91 92 94 95 30)
colorBack=(49 101 102 104 105 40)

front1="${color[(($1 - 1))]}"
front2="${color[(($3 - 1))]}"
back1="${colorBack[(($2 - 1))]}"
back2="${colorBack[(($4 - 1))]}"

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

# Вывод переменных
echo -e "\033[${back1};${front1}mHOSTNAME${close} = \033[${back2};${front2}m$HOSTNAME${close}"
echo -e "\033[${back1};${front1}mTIMEZONE${close} = \033[${back2};${front2}m$TIMEZONE${close}"
echo -e "\033[${back1};${front1}mUSER${close} = \033[${back2};${front2}m$USER${close}"
echo -e "\033[${back1};${front1}mOS${close} = \033[${back2};${front2}m$OS${close}"
echo -e "\033[${back1};${front1}mDATE${close} = \033[${back2};${front2}m$DATE${close}"
echo -e "\033[${back1};${front1}mUPTIME${close} = \033[${back2};${front2}m$UPTIME${close}"
echo -e "\033[${back1};${front1}mUPTIME_SEC${close} = \033[${back2};${front2}m$UPTIME_SEC${close}"
echo -e "\033[${back1};${front1}mIP${close} = \033[${back2};${front2}m$IP${close}"
echo -e "\033[${back1};${front1}mMASK${close} = \033[${back2};${front2}m$MASK${close}"
echo -e "\033[${back1};${front1}mGATEWAY${close} = \033[${back2};${front2}m$GATEWAY${close}"
echo -e "\033[${back1};${front1}mRAM_TOTAL${close} = \033[${back2};${front2}m$RAM_TOTAL GB${close}"
echo -e "\033[${back1};${front1}mRAM_USED${close} = \033[${back2};${front2}m$RAM_USED GB${close}"
echo -e "\033[${back1};${front1}mRAM_FREE${close} = \033[${back2};${front2}m$RAM_FREE GB${close}"
echo -e "\033[${back1};${front1}mSPACE_ROOT${close} = \033[${back2};${front2}m$SPACE_ROOT MB${close}"
echo -e "\033[${back1};${front1}mSPACE_ROOT_USED${close} = \033[${back2};${front2}m$SPACE_ROOT_USED MB${close}"
echo -e "\033[${back1};${front1}mSPACE_ROOT_FREE${close} = \033[${back2};${front2}m$SPACE_ROOT_FREE MB${close}"
# echo -e "\033[${front}mThis is red text\e[0m"
