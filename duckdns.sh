cd /root
mkdir duckdns
cd duckdns
echo 'echo url="https://www.duckdns.org/update?domains=gitmarchon&token=1da1740e-beb1-420c-b926-bdce01b4340c&ip=" | curl -k -o ~/duckdns/duck.log -K -' >> duck.sh
chmod 700 duck.sh
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo '*/5 * * * * ~/duckdns/duck.sh >/dev/null 2>&1' >> mycron
#install new cron file
crontab mycron
rm mycron
./duck.sh
