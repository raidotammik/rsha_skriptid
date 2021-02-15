WORDPRESS=$(ls /var/www/html/wordpress 2>/dev/null | grep -c 'wp-config.php')
if [ $WORDPRESS -eq 0 ]; then
	echo "Paigaldame wordpressi"
	cd /var/www/html
	wget https://wordpress.org/latest.tar.gz
	tar xzvf latest.tar.gz
	cp wordpress/wp-config-sample.php wordpress/wp-config.php
	chown -R www-data:www-data /var/www/html/wordpress
	rm latest.tar.gz
	echo "Loome andmebaasi wordpressi jaoks."
	sh ~/rsha/wordpress/mysql.sh
	echo "Andmebaas wordpressi jaoks loodud"
	cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
	sed -i "s/database_name_here/wordpress/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/username_here/wordpressuser/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/password_here/qwerty/g" /var/www/html/wordpress/wp-config.php
elif [ $WORDPRESS -eq 1 ]; then
	echo "Wordpress on paigaldatud"
#lõpetame skripti
fi
#skripti lõpp
