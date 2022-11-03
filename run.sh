#!/bin/bash
# Zte F660 Restart PPOE with curl
# 25 Agt 2022
# by Masbimmm
# The Next Generation I-wrah Tools

RED='\e[1;91m'
CYAN='\033[0;36m'
YELW='\033[1;33m'
ORANGE='\033[0;33m' 
PUR='\033[0;35m'
GRN="\e[1;92m"
WHI="\e[1;37m"
NCL='\e[1;37m'
MAGE='\e[1;35m'
echo ""
printf "$RED    ______     ____  _____  ______   _______          _ \n"
printf "$ORANGE  .' ____ \   |_   \|_   _||_   _ '.|_   __ \        / \ \n"
printf "$YELW  | (___ \_| __ |   \ | |    | | '. \ | |__) |      / _ \ \n"
printf "$MAGE   _.____'. |__|| |\ \| |    | |  | | |  __ /      / ___ \ \n"
printf "$PUR  | \____) |   _| |_\   |_  _| |_.' /_| |  \ \_  _/ /   \ \_\n"
printf "$GRN   \______.'  |_____|\____||______.'|____| |___||____| |____|\n"
printf "$NCL\n"
cat <<EOF
             -  The Next Generation I-WRAH Tools  -
-------------------------------------------------------------
                 Zte F660 Restart PPOE with curl
-------------------------------------------------------------
EOF
echo "[+] Waiting Running Tools - Time: `date`"
sleep 1


USER='admin'
PASS='Telkomdso123'

function login {
  local  _temp=$1
  local getToken=$(curl -s 'http://192.168.1.1/' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,ar;q=0.6,ru;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.92 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Connection: keep-alive' --compressed -D - -s| grep "(\"Frm_Logintoken\").value = \"[0-9]*\"" | grep -o "[0-9]*")
  echo "Assign token $getToken"
  curl 'http://192.168.1.1/' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Content-Type: application/x-www-form-urlencoded' -H 'DNT: 1' -H 'Origin: http://192.168.1.1' -H 'Pragma: no-cache' -H 'Referer: http://192.168.1.1/' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' --data-raw 'frashnum=&Frm_Logintoken='$getToken'&Username=admin&Password=Telkomdso123' --compressed --insecure  -D - -s  > /dev/null

  local setRetLocal=$(curl -s 'http://192.168.1.1/template.gch?pid=1002&nextpage=status_dev_info_t.gch' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,ar;q=0.6,ru;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.92 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Referer: http://192.168.1.1/start.ghtml' -H 'Connection: keep-alive' --compressed | grep "session_token = \"[0-9]*\"" | grep -o "[0-9]*")
  eval $_temp="'$setRetLocal'"
}

footer="- ${NCL} ${CYAN} NEVER UNBLOCKED PORT, LET'S FIND PUBLIC IP by Masbimmm. ${NCL}\n"
while :
do
  echo "Check IP"
  getip=`curl 'http://localhost/port.php' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Cookie: ' -H 'DNT: 1' -H 'Pragma: no-cache' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: none' -H 'Sec-Fetch-User: ?1' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' -H 'sec-ch-ua: "Chromium";v="106", "Google Chrome";v="106", "Not;A=Brand";v="99"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Windows"' ed 2>/dev/null`
  checkport="$(echo "$getip" | grep -c 'PORT OPEN')"
  fail="$(echo "$getip" | grep -c 'Failed')"
  if [[ $fail > 0 ]]; then
    # echo "BLOCKED By HOST"
    printf "${YELW} $getip ${NC} $footer"
    sleep 1
  else
    if [[ $checkport > 0 ]]; then
      printf "${GRN} $getip ${NC} $footer"
    else
      printf "${RED} $getip ${NC} $footer"
      printf 'Wait..., '
      while :
      do
        login TOKEN
        check=`curl 'http://192.168.1.1/getpage.gch?pid=1002&nextpage=net_wan_conf_t.gch' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Content-Type: application/x-www-form-urlencoded' -H 'DNT: 1' -H 'Origin: http://192.168.1.1' -H 'Pragma: no-cache' -H 'Referer: http://192.168.1.1/getpage.gch?pid=1002&nextpage=net_wan_conf_t.gch' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' --data-raw 'IF_ACTION=wanctype&IF_ERRORSTR=SUCC&IF_ERRORPARAM=SUCC&IF_ERRORTYPE=-1&IF_INDEX=1&IF_INSTNUM=2&IF_WANNAME0=omci_ipv4_dhcp_2&IF_WANIDENTITY0=IGD.WD1.WCD1.WCIP1&IF_WANNAME1=omci_ipv4_pppoe_1&IF_WANIDENTITY1=IGD.WD1.WCD2.WCPPP1&Enable2=&WANCName2=&ConnType2=&LANDViewName2=&StrServList2=&IsNAT2=&IsDefGW2=&IsForward2=&VLANID2=&Priority2=&WBDMode2=&IPAddress2=&SubnetMask2=&GateWay2=&DNS12=&DNS22=&DNS32=&UpTime2=&ConnStatus2=&UserName2=&Password2=&MRU2=&MTU2=&ConnTrigger2=&TransType2=&AuthType2=&IdleTime2=&WanMode2=&WanVlan2=&WanPri2=&RxPackets2=&TxPackets2=&RxBytes2=&TxBytes2=&EnableProxy2=&MaxUser2=&IPMode2=&GUASrc2=&DNSv6Src2=&Gatewayv6Src2=&MTUv6Src2=&IsPD2=&GUA12=&IsOutPreferredLft12=&GUA22=&IsOutPreferredLft22=&GUA32=&IsOutPreferredLft32=&Gatewayv62=&DNS1v62=&DNS2v62=&DNS3v62=&MTUv62=&DSLiteEnable2=&AFTRAddrSrc2=&DNSv4DlSrc2=&AFTRAddr2=&DNSv4Dl2=&IsAFTRDmname2=&AFTRDomainName2=&PPPExtend2=&IPMode0=ipv4&IPMode1=ipv4&IF_ADMINSTATUS=&IF_OPESTATUS=&IF_MULTIDISPLAY=0&IF_TYPE=PPPoE&IF_NAME=omci_ipv4_pppoe_1&IF_MODE=&IF_IDLE=' --compressed --insecure -D - -s`
        checkod="$(echo "$check" | grep -c "'ConnTrigger1','AlwaysOn'")"
        if [[ $checkod > 0 ]]; then
          curl -s 'http://192.168.1.1/getpage.gch?pid=1002&nextpage=net_wan_conf_t.gch' -H 'Origin: http://192.168.1.1' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8,ar;q=0.6,ru;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.92 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://192.168.1.1/getpage.gch?pid=1002&nextpage=manager_dev_conf_t.gch' -H 'Connection: keep-alive' --data "IF_ACTION=apply&IF_ERRORSTR=SUCC&IF_ERRORPARAM=SUCC&IF_ERRORTYPE=-1&IF_INDEX=1&IF_INSTNUM=2&IF_WANNAME0=omci_ipv4_dhcp_2&IF_WANIDENTITY0=IGD.WD1.WCD1.WCIP1&IF_WANNAME1=omci_ipv4_pppoe_1&IF_WANIDENTITY1=IGD.WD1.WCD2.WCPPP1&Enable1=1&WANCName1=omci_ipv4_pppoe_1&ConnType1=NULL&LANDViewName1=NULL&StrServList1=TR069_VOIP_INTERNET&IsNAT1=NULL&IsDefGW1=NULL&IsForward1=NULL&VLANID1=3253&Priority1=7&WBDMode1=Tag_Drop&IPAddress1=NULL&SubnetMask1=NULL&GateWay1=NULL&DNS11=NULL&DNS21=NULL&DNS31=NULL&UpTime1=NULL&ConnStatus1=NULL&UserName1=122429205735%40telkom.net&Password1=GDVJKN14AG&MRU1=NULL&MTU1=NULL&ConnTrigger1=OnDemand&TransType1=PPPoE&AuthType1=PAP%2CCHAP%2CMS-CHAP&IdleTime1=1200&WanMode1=2&WanVlan1=3253&WanPri1=7&RxPackets1=NULL&TxPackets1=NULL&RxBytes1=NULL&TxBytes1=NULL&EnableProxy1=NULL&MaxUser1=NULL&IPMode1=0&GUASrc1=NULL&DNSv6Src1=NULL&Gatewayv6Src1=NULL&MTUv6Src1=NULL&IsPD1=NULL&GUA11=NULL&IsOutPreferredLft11=NULL&GUA21=NULL&IsOutPreferredLft21=NULL&GUA31=NULL&IsOutPreferredLft31=NULL&Gatewayv61=NULL&DNS1v61=NULL&DNS2v61=NULL&DNS3v61=NULL&MTUv61=NULL&DSLiteEnable1=NULL&AFTRAddrSrc1=NULL&DNSv4DlSrc1=NULL&AFTRAddr1=NULL&DNSv4Dl1=NULL&IsAFTRDmname1=NULL&AFTRDomainName1=NULL&PPPExtend1=NULL&IPMode0=ipv4&IPMode1=&IF_ADMINSTATUS=&IF_OPESTATUS=&IF_MULTIDISPLAY=0&IF_TYPE=PPPoE&IF_NAME=omci_ipv4_pppoe_1&IF_MODE=&IF_IDLE=edit&_SESSION_TOKEN=$TOKEN" --compressed > /dev/null
          printf "${NC} ${YELW}$getip Set => AON to OD ${NC}\n"
        else
          curl -s 'http://192.168.1.1/getpage.gch?pid=1002&nextpage=net_wan_conf_t.gch' -H 'Origin: http://192.168.1.1' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-US,en;q=0.8,ar;q=0.6,ru;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.92 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: http://192.168.1.1/getpage.gch?pid=1002&nextpage=manager_dev_conf_t.gch' -H 'Connection: keep-alive' --data "IF_ACTION=apply&IF_ERRORSTR=SUCC&IF_ERRORPARAM=SUCC&IF_ERRORTYPE=-1&IF_INDEX=1&IF_INSTNUM=2&IF_WANNAME0=omci_ipv4_dhcp_2&IF_WANIDENTITY0=IGD.WD1.WCD1.WCIP1&IF_WANNAME1=omci_ipv4_pppoe_1&IF_WANIDENTITY1=IGD.WD1.WCD2.WCPPP1&Enable1=1&WANCName1=omci_ipv4_pppoe_1&ConnType1=NULL&LANDViewName1=NULL&StrServList1=TR069_VOIP_INTERNET&IsNAT1=NULL&IsDefGW1=NULL&IsForward1=NULL&VLANID1=3253&Priority1=7&WBDMode1=Tag_Drop&IPAddress1=NULL&SubnetMask1=NULL&GateWay1=NULL&DNS11=NULL&DNS21=NULL&DNS31=NULL&UpTime1=NULL&ConnStatus1=NULL&UserName1=122429205735%40telkom.net&Password1=GDVJKN14AG&MRU1=NULL&MTU1=NULL&ConnTrigger1=AlwaysOn&TransType1=PPPoE&AuthType1=PAP%2CCHAP%2CMS-CHAP&IdleTime1=NULL&WanMode1=2&WanVlan1=3253&WanPri1=7&RxPackets1=NULL&TxPackets1=NULL&RxBytes1=NULL&TxBytes1=NULL&EnableProxy1=NULL&MaxUser1=NULL&IPMode1=0&GUASrc1=NULL&DNSv6Src1=NULL&Gatewayv6Src1=NULL&MTUv6Src1=NULL&IsPD1=NULL&GUA11=NULL&IsOutPreferredLft11=NULL&GUA21=NULL&IsOutPreferredLft21=NULL&GUA31=NULL&IsOutPreferredLft31=NULL&Gatewayv61=NULL&DNS1v61=NULL&DNS2v61=NULL&DNS3v61=NULL&MTUv61=NULL&DSLiteEnable1=NULL&AFTRAddrSrc1=NULL&DNSv4DlSrc1=NULL&AFTRAddr1=NULL&DNSv4Dl1=NULL&IsAFTRDmname1=NULL&AFTRDomainName1=NULL&PPPExtend1=NULL&IPMode0=ipv4&IPMode1=&IF_ADMINSTATUS=&IF_OPESTATUS=&IF_MULTIDISPLAY=0&IF_TYPE=PPPoE&IF_NAME=omci_ipv4_pppoe_1&IF_MODE=&IF_IDLE=edit&_SESSION_TOKEN=$TOKEN" --compressed > /dev/null
          printf "${NC} ${YELW}$getip Set => OD to AON ${NC}\n"
        fi
        sleep 5
        getip=`curl 'http://localhost/port.php' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'Accept-Language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' -H 'Cookie: ' -H 'DNT: 1' -H 'Pragma: no-cache' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: none' -H 'Sec-Fetch-User: ?1' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' -H 'sec-ch-ua: "Chromium";v="106", "Google Chrome";v="106", "Not;A=Brand";v="99"' -H 'sec-ch-ua-mobile: ?0' -H 'sec-ch-ua-platform: "Windows"' ed 2>/dev/null`
        checkport="$(echo "$getip" | grep -c 'PORT OPEN')"
        fail="$(echo "$getip" | grep -c 'Failed')"
        if [[ $fail > 0 ]]; then
          break
        else
          if [[ $checkport > 0 ]]; then
            printf "${GRN} $getip ${NC} $footer"
          else
            printf "${RED} $getip ${NC} $footer"
          fi

          if [[ $checkport > 0 ]]; then
            break
          fi
        fi
        
      done
    fi
    sleep 600
  fi
done
