# ./bin/bash

IFS=","

MY_FILE=$1

groupadd ftpUsers

cat $MY_FILE | while read a b c d e;
do

UserName="$b$c"
UserNameNoSpace="${UserName// /}"
UserPasswd="$d$d"

#avoid the first line
if [ "$a" != "Id" ];
	then
		#adduser anyway and set their passwords
		sudo useradd -m -d /home "$UserNameNoSpace"
                echo "$UserNameNoSpace":"$UserPasswd" | sudo chpasswd
		sudo adduser $UserNameNoSpace ftpUsers

		#Test if their a sudo and attribute it if its true
		if [[ "$e" = *"Admin"* ]];
		then
		sudo adduser "$UserNameNoSpace" sudo
		fi
	else
	echo "$a : $b : $c : $d : $e"
	fi
done
