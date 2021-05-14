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
echo "--2. Lock user account"
echo "--3. unlock user account"
echo "--4. delete user account"
echo "--5. Show All Users"
echo "--6. Show connecting users"
echo "--7. Disconnect the specified user"
echo "--8. Prints the banned IP addresses"
echo "--9. Unban the specified IP"
read -r
user_selection=$REPLY


if [ $user_selection -eq "1" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  sudo ocpasswd -c /etc/ocserv/ocpasswd $user_name
  echo "user created successfully"
elif [ $user_selection -eq "2" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  sudo ocpasswd -l -c /etc/ocserv/ocpasswd $user_name
  echo "user locked successfully"
elif [ $user_selection -eq "3" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  sudo ocpasswd -u -c /etc/ocserv/ocpasswd $user_name
  echo "user unlocked successfully"
elif [ $user_selection -eq "4" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  sudo ocpasswd -d -c /etc/ocserv/ocpasswd $user_name
  echo "user deleted successfully"
elif [ $user_selection -eq "5" ]
then
  echo ""
  echo ""
  echo "########################################################################"
  sudo cat /etc/ocserv/ocpasswd
  echo "########################################################################"
  echo ""
  echo ""
elif [ $user_selection -eq "6" ]
then
  occtl  show events
  echo ""
elif [ $user_selection -eq "7" ]
then
  echo "Please enter the user name"
  read -r
  user_name=$REPLY
  occtl disconnect user $user_name
  echo ""
elif [ $user_selection -eq "8" ]
then
  occtl show ip bans
  echo ""
elif [ $user_selection -eq "9" ]
then
  echo "Please enter the user IP address"
  read -r
  user_ip=$REPLY
  occtl unban ip $user_ip
  echo ""
else
  echo "You did not select the correct option"
  echo ""
fi


