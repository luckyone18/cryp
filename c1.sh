b="\033[34;1m"
p="\033[39;1m"
k="\033[33;1m"
m="\033[31;1m"
h="\033[32;1m"
c="\033[35;1m"
pu="\033[36;1m"
x="\033[30;1m"
o="\033[0m"
clear
function check(){
if [ -z $(command -v curl) ];then
printf "${p}[${m}!${p}]${m}curl belum di install!!\n"
printf "${p}[${m}!${p}]${h}pkg install curl\n"
printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"
exit
fi
if [ -z $(command -v bash) ];then
printf "${p}[${m}!${p}]${m}bash belum di install!!\n"
printf "${p}[${m}!${p}]${h}pkg install bash\n"
printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"
exit
fi
if [ -z $(command -v jq) ];then
printf "${p}[${m}!${p}]${m}jq belum di install!!\n"
printf "${p}[${m}!${p}]${h}pkg install jq\n"
printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"
exit
fi
if [ -z $(command -v nano) ];then
printf "${p}[${m}!${p}]${m}nano belum di install!!\n"
printf "${p}[${m}!${p}]${h}pkg install nano\n"
printf "${p}[${m}!${p}]${m}Silahkan Install dulu\n"
exit
fi
}
check
function sec(){
declare -A a
d=('-' '\\\\'  '|' '\/')
ci=-1
bi='-------'
e=0
for x in {5..0};do
if [[ $(( $x % 1 )) == 0  ]];then
a+="="
let ci=$ci-1
fi
printf "\r\t${p}[${k}?${p}] Sedang Login [${a[@]}${bi:0:ci}] (${h}$x${p}) "
sleep 0.99
done
printf "\n"
}
function sec1(){
declare -A a
d=('-' '\\\\'  '|' '\/')
ci=-1
bi='-------'
e=0
for x in {5..0};do
if [[ $(( $x % 1 )) == 0  ]];then
a+="="
let ci=$ci-1
fi
printf "\r\t${p}[${k}?${p}] Proses Claim Misi [${a[@]}${bi:0:ci}] (${h}$x${p}) "
sleep 0.99
done
printf "\n"
}
function sec2(){
declare -A a
d=('-' '\\\\'  '|' '\/')
ci=-1
bi='-------'
e=0
for x in {5..0};do
if [[ $(( $x % 1 )) == 0  ]];then
a+="="
let ci=$ci-1
fi
printf "\r\t${p}[${k}?${p}] Bypass Misi [${a[@]}${bi:0:ci}] (${h}$x${p}) "
sleep 0.99
done
printf "\n"
}
function banner(){
clear
printf "\t                  ${x}Tools${m}: ${p}1.0 *_*\n"
printf "\t${b}______________________________\n"
printf "\t      ${p}Author${m}: ${c}Mr.Tr3v!0n\n"
printf "\t   ${p}Team${m}: ${h}Black Coder Crush\n"
printf "\t${p}   TOOLS NUYUL CYPTOPLACE \n"
printf "\t${p} WEB PENGHASIL BTC, LTC, DASH\n"
printf "\t   ${p}Telegram${m}: ${c}@config_geratis\n"
printf "\t    ${p}Subs Youtube${m}: ${k}Inject ID\n"
printf "\t${b}______________________________\n"
printf "\t ${x}[08-10-20] ${m}| ${x}©Copyright_2020\n\n"
printf " ${p}      Link Web${m}: ${h}https://bit.ly/3d6Lemk\n\n"
}
banner

sec
cfd=$(curl -s "https://cryptoplace.cloud" -I | grep -Eo "__cfd.*" | cut -d ";" -f1)
lgn=$(curl -s -X POST -H "user-agent:Mozilla/5.0 (Linux; Android 9; Redmi 6A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.101 Mobile Safari/537.36" -H "cookie:$cfd" -d "username=checksaja@gmail.com&password=herian0990-=." "https://cryptoplace.cloud/users/login")
suc=$(echo -e "$lgn" | jq -r .style)
if [[ ${suc} =~ "success" ]];then
echo -e "\t${p}[${pu}√${p}] ${k}Login ${h}Success! \n"
sleep 1
for (( i=1; i>=i; i++ ));do
cfd=$(curl -s "https://cryptoplace.cloud" -I | grep -Eo "__cfd.*" | cut -d ";" -f1)
lgn=$(curl -s -X POST -H "user-agent:Mozilla/5.0 (Linux; Android 9; Redmi 6A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.101 Mobile Safari/537.36" -H "cookie:$cfd" -d "username=checksaja@gmail.com&password=herian0990-=." "https://cryptoplace.cloud/users/login")
suc=$(echo -e "$lgn" | jq -r .style)
clk=$(curl -s -X GET -H "user-agent:Mozilla/5.0 (Linux; Android 9; Redmi 6A) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.101 Mobile Safari/537.36" -H "cookie:$cfd"  "https://cryptoplace.cloud/bonus/get_bonus")
sc=$(echo -e "$clk" | jq -r .style)
dt=$(echo -e "$clk" | jq -r .seconds_to_bonus)
ok=$(echo -e "$clk" | jq -r .desc)
usd=$(echo -e "$clk" | jq -r .amount_usd)
if [[ ${sc} =~ "error" ]];then
for (( w = $dt;  w >= 0; w-- ));do
cok=$(echo -e "\r\t${p}[${h}•${p}] Waiting Second ${m}[ ${k}${w} ${m}]  ")
printf "${k}$cok"
sleep 1
done
elif [[ ${sc} =~ "success" ]];then
echo -e "\n\t${p}[${h}`date +%H:%M:%S`${p}] ${k}Claim Bonus ${h}Succes!"
echo -e "\t${p}[${h}`date +%H:%M:%S`${p}] ${h}${ok}"
echo -e "\t${p}[${h}`date +%H:%M:%S`${p}] ${k}Usd${m}: ${h}${usd}\n"
fi
done
elif [[ ${suc} =~ "error" ]];then
echo -e "\n\t${p}[${m}X${p}] ${k}Login ${m}Gagal! "
echo -e "\t${p}[${k}!${p}] ${p}Cek Lagi User & Pass nya ${m}!! "
echo -e "\t${p}[${k}!${p}] ${p}Dengan Benar Dan Teliti ${m}!! \n"
exit 1
fi
