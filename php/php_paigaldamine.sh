# php paigaldusskript
#
# php 7.4 install ja kontroll
PHP=$(dpkg-query -W -f='${Status}' php7.4 2>/dev/null | grep -c 'ok installed')
# kui väärtus on 0
if [ $PHP -eq 0 ]; then
	echo "Paigaldame php ja vajalikud lisad"
	apt install php7.4 libapache2-mod-php7.4 php7.4-mysql
	echo "php on paigaldatud"
# kui väärtus on 1
elif [ $PHP -eq 1 ]; then
	echo "php on juba paigaldatud"
	which php
fi
# skripti lopp

