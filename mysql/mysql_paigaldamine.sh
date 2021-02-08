# mysql-server paigaldusskript
#
MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed')
# kui MYSQL muutuja on 0
if [ $MYSQL -eq 0 ]; then
	echo "Paigaldame mysql ja vajalikud lisad"
	apt install mysql-server
	echo "mysql on paigaldatud"
	# mysql kasutamine ilma sisselogimata
	touch $HOME/.my.cnf # vajalik konfiguratsiooni fail antud kasutaja kaustas
	echo "[client]" >> $HOME/.my.cnf
	echo "host = localhost" >> $HOME/.my.cnf
	echo "user = root" >> $HOME/.my.cnf
	echo "password = qwerty" >> $HOME/.my.cnf
# kui MYSQL muutuja on 1
elif [ $MYSQL -eq 1 ]; then
	echo "mysql-server on juba paigaldatud"
	mysql
fi
# skripti lopp
