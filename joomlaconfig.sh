echo
echo "     START OF AUTOMATED CONFIGURATION"
echo

# set the hostname variable
CODIO_HOST=`cat /etc/hostname`  
WORKSPACE="$HOME/workspace" 

echo -e '\E[1;33;44m' "Creating the MySQL database that Joomla will use"; tput sgr0
# This script uses the default password 'password' - IT IS NOT SECURE!
echo "CREATE DATABASE joomla;" > msqlcmds.txt
echo "USE joomla;" >> msqlcmds.txt
echo "CREATE USER joomlauser@localhost;" >> msqlcmds.txt
# note escaped quotes on line below
echo "SET PASSWORD FOR joomlauser@localhost= PASSWORD(\"password\");" >> msqlcmds.txt
########################                  joomlauser    ########
 
echo "GRANT ALL PRIVILEGES ON joomla.* TO joomlauser@localhost IDENTIFIED BY 'password';" >> msqlcmds.txt
########################                                         joomlauser      ########
echo "FLUSH PRIVILEGES;" >> msqlcmds.txt
echo "exit" >> msqlcmds.txt
 
echo -e '\E[1;33;44m' "The password for the MySQL server is blank!"; tput sgr0
echo -e '\E[1;33;44m' "You should change it after instalation."; tput sgr0
echo - 
echo -e '\E[1;33;44m' "For now - Just press the enter key to enter the blank password"; tput sgr0
mysql -u root -p < msqlcmds.txt -v



chmod 755 configuration.php

rm joomlaconfig.sh