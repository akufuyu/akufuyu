#!/bin/bash

source default.config

color_name(){
    case $1 in
      "1")
      echo "white"
      ;;
      "2")
      echo "red"
      ;;
      "3")
      echo "green"
      ;;
      "4")
      echo "blue"
      ;;
      "5")
      echo "purple"
      ;;
      "6")
      echo "black"
      ;;
    esac
}

color_print(){
    local color_type=""
    # echo "Argument = $1"
    # echo "Argument = $2"
    if [ "$1" == "$2" ];then
        color_type="default"
    else
        color_type=$1
    fi

    local the_color_name=$(color_name $1)
    echo "$color_type ($the_color_name)"
}

def_color1=6
def_color2=3
def_color3=2
def_color4=6

color1=$column1_background
color2=$column1_font_color
color3=$column2_background
color4=$column2_font_color

if [ -z "$column1_background" ];then
    color1=$def_color1
fi

if [ -z "$column1_font_color" ];then
    color2=$def_color2
fi

if [ -z "$column2_background" ];then
    color3=$def_color3
fi

if [ -z "$column2_font_color" ];then
    color4=$def_color4
fi


# Сброс цвета
close="\e[0m"

# Цветовые гаммы отличаются на фронте и беке
color=(97 91 92 94 95 30)
colorBack=(49 101 102 104 105 40)

front1="${color[((color1 - 1))]}"
front2="${color[((color3 - 1))]}"
back1="${colorBack[((color2 - 1))]}"
back2="${colorBack[((color4 - 1))]}"

# # Присвоение переменных
# HOSTNAME=$(hostname)
# TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3}')
# TIMEZONE="$TIMEZONE UTC $(date +"%:z" | sed 's/+0\([1-9]\):00/+\1/')"
# USER=$(whoami)
# OS="Unknown"
# source /etc/os-release
# OS=$PRETTY_NAME
# DATE=$(date '+%d %b %Y %H:%M:%S')
# UPTIME=$(uptime -p)
# UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
# IP=$(hostname -I | awk '{print $1}')
# #src % ifconfig | grep inet | awk 'NR == 1{print $2}'
# MASK=$(ifconfig | grep ${IP} | awk '{print $4}')
# GATEWAY=$(ip route | grep default | awk '{print $3}')
# RAM_TOTAL=$(grep -i 'memtotal' /proc/meminfo | awk '{printf ("%.3f", $2/1024/1024);}')
# RAM_USED=$(free | grep "Mem:" | awk '{printf ("%.3f", $3/1024/1024);}')
# RAM_FREE=$(free | grep "Mem:" | awk '{printf ("%.3f", $4/1024/1024);}')
# SPACE_ROOT=$(df / | awk 'NR==2 {printf ("%.2f", $2/1024);}')
# SPACE_ROOT_USED=$(df / | awk 'NR==2 {printf ("%.2f", $3/1024);}')
# SPACE_ROOT_FREE=$(df / | awk 'NR==2 {printf ("%.2f", $4/1024);}')



# # Вывод переменных
# echo -e "\033[${back1};${front1}mHOSTNAME${close} = \033[${back2};${front2}m$HOSTNAME${close}"
# echo -e "\033[${back1};${front1}mTIMEZONE${close} = \033[${back2};${front2}m$TIMEZONE${close}"
# echo -e "\033[${back1};${front1}mUSER${close} = \033[${back2};${front2}m$USER${close}"
# echo -e "\033[${back1};${front1}mOS${close} = \033[${back2};${front2}m$OS${close}"
# echo -e "\033[${back1};${front1}mDATE${close} = \033[${back2};${front2}m$DATE${close}"
# echo -e "\033[${back1};${front1}mUPTIME${close} = \033[${back2};${front2}m$UPTIME${close}"
# echo -e "\033[${back1};${front1}mUPTIME_SEC${close} = \033[${back2};${front2}m$UPTIME_SEC${close}"
# echo -e "\033[${back1};${front1}mIP${close} = \033[${back2};${front2}m$IP${close}"
# echo -e "\033[${back1};${front1}mMASK${close} = \033[${back2};${front2}m$MASK${close}"
# echo -e "\033[${back1};${front1}mGATEWAY${close} = \033[${back2};${front2}m$GATEWAY${close}"
# echo -e "\033[${back1};${front1}mRAM_TOTAL${close} = \033[${back2};${front2}m$RAM_TOTAL GB${close}"
# echo -e "\033[${back1};${front1}mRAM_USED${close} = \033[${back2};${front2}m$RAM_USED GB${close}"
# echo -e "\033[${back1};${front1}mRAM_FREE${close} = \033[${back2};${front2}m$RAM_FREE GB${close}"
# echo -e "\033[${back1};${front1}mSPACE_ROOT${close} = \033[${back2};${front2}m$SPACE_ROOT MB${close}"
# echo -e "\033[${back1};${front1}mSPACE_ROOT_USED${close} = \033[${back2};${front2}m$SPACE_ROOT_USED MB${close}"
# echo -e "\033[${back1};${front1}mSPACE_ROOT_FREE${close} = \033[${back2};${front2}m$SPACE_ROOT_FREE MB${close}"

source ../03/main.sh $color1 $color2 $color3 $color4 

echo

# func_com=$(color_print $color1 $def_color1)
echo "Column 1 background = $(color_print $color1 $def_color1)"

# func_com=$(color_print $color2 $def_color2)
echo "Column 1 font color = $(color_print $color2 $def_color2)"

# func_com=$(color_print $color3 $def_color3)
echo "Column 2 background = $(color_print $color3 $def_color3)"

# func_com=$(color_print $color4 $def_color4)
echo "Column 2 font color = $(color_print $color4 $def_color4)"