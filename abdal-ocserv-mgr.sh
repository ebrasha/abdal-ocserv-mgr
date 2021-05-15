#!/bin/bash
echo -e "
+-+-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+
|A|b|d|a|l| |O|c|S|e|r|v| |M|G|R|
+-+-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+
Programmer : Ebrahim Shafiei (EbraSha)
Email: Prof.Shafiei@Gmail.com
"
echo "Please select your action"
echo "--1. Create a user"
echo "--2. Change user pass"
echo "--3. Lock user account"
echo "--4. unlock user account"
echo "--5. delete user account"
echo "--6. Show All Users"
echo "--7. Show connecting users"
echo "--8. Disconnect the specified user"
echo "--9. Prints the banned IP addresses"
echo "--10. Unban the specified IP"
echo "--11. Show Users Connection Software Type"
read -r
user_selection=$REPLY


if [ $user_selection -eq "1" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  ocpasswd -c /etc/ocserv/ocpasswd $user_name
  echo "user created successfully"
elif [ $user_selection -eq "2" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  ocpasswd -c /etc/ocserv/ocpasswd $user_name
  echo "password has been changed successfully"
elif [ $user_selection -eq "3" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  ocpasswd -l -c /etc/ocserv/ocpasswd $user_name
  echo "user locked successfully"
elif [ $user_selection -eq "4" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  ocpasswd -u -c /etc/ocserv/ocpasswd $user_name
  echo "user unlocked successfully"
elif [ $user_selection -eq "5" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  ocpasswd -d -c /etc/ocserv/ocpasswd $user_name
  echo "user deleted successfully"
elif [ $user_selection -eq "6" ]
then
  clear
  echo ""
  echo ""
  echo "########################################################################"
  cat /etc/ocserv/ocpasswd
  echo "########################################################################"
  echo ""
  echo ""
elif [ $user_selection -eq "7" ]
then
  occtl  show events
  echo ""
elif [ $user_selection -eq "8" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  occtl disconnect user $user_name
  echo ""
elif [ $user_selection -eq "9" ]
then
  occtl show ip bans
  echo ""
elif [ $user_selection -eq "10" ]
then
  echo "Please enter the user IP address"
  read -r
  user_ip=$REPLY
  occtl unban ip $user_ip
  echo ""
elif [ $user_selection -eq "11" ]
then
  occtl show sessions all  > /etc/ocserv/temp_ocserv
  user_connection_info_file="/etc/ocserv/temp_ocserv"
  while read line; do echo "---" $line | awk '{print $3, $6 ,$7}'; done < $user_connection_info_file
  rm -f /etc/ocserv/temp_ocserv
  echo ""
else
  echo "You did not select the correct option"
  echo ""
fi


