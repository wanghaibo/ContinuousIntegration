#!/bin/bash
#@author wanghaibo
#初始化参数
NAME="test"
#分析参数
while getopts "n:h" opt
do
    case $opt in
        n ) NAME=$OPTARG;;
        ? ) 
            echo "-n username"
            exit 1;;
    esac
done
/usr/bin/git clone "/var/www/html/m_master/.git" "/var/www/html/m_$NAME"
sed "s/server_name  m\.10jqka\.com\.cn/server_name  m_$NAME\.10jqka\.com\.cn/" /usr/local/nginx/conf/vhosts/m.conf > "/usr/local/nginx/conf/vhosts/m_$NAME.conf"
/usr/local/nginx/sbin/nginx -s reload

