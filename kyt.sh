#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color

cd /etc/systemd/system/
rm -rf kyt.service
cd
grenbo="\e[92;1m"
NC='\e[0m'
#install
cd /usr/bin
rm -rf kyt
rm -rf bot
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/xknjt/autosc/main/Bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
cd
wget https://raw.githubusercontent.com/xknjt/autosc/main/Bot/kyt.zip
unzip kyt.zip
cp -r kyt /usr/bin/
cd /usr/bin
pip3 install -r kyt/requirements.txt
#isi data
echo ""
figlet  SKAYZU  | lolcat
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\e[1;97;101m               𝗔𝗗𝗗 𝗕𝗢𝗧 𝗣𝗔𝗡𝗘𝗟           \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}𝚃𝚞𝚝𝚘𝚛𝚒𝚊𝚕 𝙲𝚛𝚎𝚊𝚝 𝙱𝚘𝚝 𝚊𝚗𝚍 𝙸𝙳 𝚃𝚎𝚕𝚎𝚐𝚛𝚊𝚖${NC}"
echo -e "${grenbo}[*] 𝙲𝚛𝚎𝚊𝚝 𝙱𝚘𝚝 𝚊𝚗𝚍 𝚃𝚘𝚔𝚎𝚗 𝙱𝚘𝚝 : @BotFather${NC}"
echo -e "${grenbo}[*] 𝙸𝚗𝚏𝚘 𝙸𝚍 𝚃𝚎𝚕𝚎𝚐𝚛𝚊𝚖 : @MissRose_bot , 𝙿𝚎𝚛𝚒𝚗𝚝𝚊𝚑 /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] 𝙸𝚗𝚙𝚞𝚝 𝚢𝚘𝚞𝚛 𝙱𝚘𝚝 𝚃𝚘𝚔𝚎𝚗 : " bottoken
read -e -p "[*] 𝙸𝚗𝚙𝚞𝚝 𝚈𝚘𝚞𝚛 𝙸𝚍 𝚃𝚎𝚕𝚎𝚐𝚛𝚊𝚖 :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
rm /etc/bot/.bot.db
echo "#bot# ${bottoken} ${admin}" >>/etc/bot/.bot.db
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt
cd /root
rm -rf kyt*
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "𝗧𝗼𝗸𝗲𝗻 𝗕𝗼𝘁         : $bottoken"
echo "𝗔𝗱𝗺𝗶𝗻          : $admin"
echo "𝗗𝗼𝗺𝗮𝗶𝗻        : $domain"
echo -e "==============================="
echo "Setting done"
echo "Installations complete, type /menu on your bot"
echo " "
read -p "press any key for exit"
menu
