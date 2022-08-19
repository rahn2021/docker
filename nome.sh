#! /bin/bash

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}

function sshwifty_nome(){
    cd
    mkdir -p docker/sshwifty
    cd docker/sshwifty
    ufw allow 8182/tcp
    wget https://raw.githubusercontent.com/rahn2021/docker/main/sshwifty/docker-compose.yml
    docker-compose up -d
    echo https://172.17.0.1:8182
    echo https://ssh.nome.tk
}

function wordpress_nome(){
    cd
    mkdir -p docker/wordpress
    cd docker/wordpress
    docker-compose down
    rm docker-compose.yml
    wget https://raw.githubusercontent.com/rahn2021/docker/main/WordPress/docker-compose.yml
    docker-compose up -d
    ufw allow 8080/tcp
    ufw allow 3333/tcp
    echo https://localhost:8080
    echo https://nav.yuitaku.tk
    echo https://localhost:3333
    echo https://phpmyadmin.yuitaku.tk
}

function halo_nome(){
    cd
    ufw allow 8090/tcp
    docker pull halohub/halo:latest
    docker run -it -d --name halo -p 8090:8090 -v ~/.halo:/root/.halo halohub/halo:latest
    echo https://localhost:8090
    echo https://blog.yuitaku.tk
}

function docker_nome(){
	echo 正在安装 Docker
    snap install docker
	echo 正在安装 Docker-Compose 
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    echo 安装完毕！
}

function alist_nome(){
	echo 安装 Alist
    curl -fsSL "https://nn.ci/alist.sh" | bash -s install
    ufw allow 5244/tcp
    echo https://localhost:5244
    echo https://wp.yuitaku.tk
}

function shadowsocks_nome(){
    cd
    wget https://raw.githubusercontent.com/lanlandezei/shadowsocks-libev/main/install.sh && chmod +x install.sh && bash install.sh
    echo 开启SS端口：ufw allow 端口/tcp
    echo ufw allow /tcp
}

function czvf_nome(){
	echo 打包docker halo
    cd
    tar czvf docker.tar docker
    tar czvf halo.tar .halo
    echo 打包完成
}

function xzvf_nome(){
	echo 解压docker halo
    cd
    tar xzvf docker.tar
    tar xzvf halo.tar
    echo 解压完毕
}

function czhalo_nome(){
    cd
    tar czvf halo.tar .halo
    echo 打包halo完毕
}

function czdocker_nome(){
    cd
    tar czvf docker.tar docker
    echo 打包docker完毕
}

function alist_docker_nome(){
    cd
    mkdir -p docker/alist
    cd docker/alist
    docker run -d --restart=always -v /root/docker/alist/etc/alist:/opt/alist/data -p 6044:5244 --name="alist" xhofe/alist:latest
    ufw allow 6044/tcp
    docker logs alist
    echo https://localhost:6044
    echo https://alist.yuitaku.tk
    echo alist-docker 安装完毕
}

function qb_nome(){
    cd
    mkdir -p docker/qBittorrent
    cd docker/qBittorrent
    rm docker-compose.yml
    wget https://raw.githubusercontent.com/rahn2021/docker/main/qbittorrent/docker-compose.yml
    docker-compose up -d
    ufw allow 8081/tcp
    echo https://localhost:8081
    echo https://qb.yuitaku.tk
    echo 初始账号 admin 初始密码 adminadmin
    echo qBittorrent 安装完毕！
}

function npm_nome(){
    cd
    ufw allow 80/tcp
    ufw allow 81/tcp
    ufw allow 443/tcp
    mkdir -p docker/nginx-proxy-manager
    cd docker/nginx-proxy-manager
    rm docker-compose.yml
    wget https://raw.githubusercontent.com/rahn2021/docker/main/Nginx%20Proxy%20Manager/docker-compose.yml
    docker-compose up -d
    echo 初始账号 admin@example.com 初始密码 changeme
    echo https://localhost:81
    echo https://npm.yuitaku.tk
}



function rustdesk_nome(){
    cd
    ufw allow 21115/tcp
    ufw allow 21116/tcp
    ufw allow 21116/udp
    ufw allow 21117/tcp
    ufw allow 21118/tcp
    ufw allow 21119/tcp
    mkdir -p docker/rustdesk
    cd docker/rustdesk
    wget https://raw.githubusercontent.com/rahn2021/docker/main/Rust%20Desk/docker-compose.yml
    docker-compose up -d
    echo cd docker/rustdesk/hbbs
    echo id_edxxxx.pub 为加密通话文件 cat id_edxxxx.pub
    echo https://localhost:21117
    echo https://desk.yuitaku.tk
}

function Minimalist_nome(){
    cd
    mkdir -p docker/minimalist
    cd docker/minimalist/
    wget https://github.com/pereorga/minimalist-web-notepad/archive/refs/heads/docker.zip
    ls
    unzip docker.zip
    cd minimalist-web-notepad-docker/
    ufw allow 8006/tcp
    docker build -t minimalist-web-notepad .
    docker run -d -it --restart=always --name minimalist-web-notepad -v /root/docker/minimalist/minimalist-web-notepad-docker/minimalist-data:/var/www/html/_tmp -p 8006:80 minimalist-web-notepad
    echo https://localhost:8006
    echo https://notes.yuitaku.tk  
    echo Minimalist 安装完成
}

function reader3_nome(){
    cd
    ufw allow 4396/tcp
    mkdir -p docker/reader
    cd docker/reader
    rm docker-compose.yml
    wget https://raw.githubusercontent.com/rahn2021/docker/main/Reader/docker-compose.yml
    docker-compose up -d
    echo https://localhost:4396
    echo https://reader.yuitaku.tk
    echo 账号 admin 密码 adminpwd 邀请码 registercode
}

function lxde_nome(){
    apt-get update
    apt-get -y install lxde
    apt-get -y install xrdp
    ufw allow 3389
    echo 安装 LXDE 完毕
}

#主菜单
function start_menu(){
    clear
    red " VPS 一键脚本大全" 
    green " USE:  wget -O nome.sh https://raw.githubusercontent.com/BlueSkyXN/SKY-BOX/main/box.sh && chmod +x box.sh && clear && ./box.sh "
    yellow " =================================================="
    green " 1. docker docker-compose 安装" 
    green " 2. 安装 Alist "
    green " 3. 安装 Shdowsocks"
    green " 4. 解压 docker halo 数据"    
    green " 5. 打包数据"
    green " 6. 打包 HALO 博客"
    green " 7. 打包 Docker 数据"
    green " 8. 安装轻量级桌面 LXDE"
    yellow " --------------------------------------------------"
    green " 20. 安装Alist docker版本"
    green " 21. 安装QB"
    green " 22. 安装npm"
    green " 23. 安装 Minimalist 记事本"
    green " 24. 安装 Reader3 网页版"
    green " 25. 安装 halo"
    green " 26. 安装 sshwifty"
    green " 27. 安装 Rust Desk 远程桌面搭建"
    green " 28. 安装 Wordpress mysql phpmyadmin"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           docker_nome
	;;
        2 )
           alist_nome
	;;
        3 )
           shadowsocks_nome
	;;
        4 )
           xzvf_nome
	;;
        5 )
           czvf_nome
	;;
        6 )
           czhalo_nome
	;;
        7 )
           czdocker_nome
	;;
        8 )
           lxde_nome
	;;
        20 )
           alist_docker_nome
	;;
        21 )
           qb_nome
	;;
        22 )
           npm_nome
	;;
        23 )
           Minimalist_nome
	;;
        24 )
           reader3_nome
	;;
        25 )
           halo_nome
	;;
        26 )
           sshwifty_nome
	;;
        27 )
           rustdesk_nome
	;;
        28 )
           wordpress_nome
	;;
        0 )
            exit 1
        ;;
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
