mysql <<EOF
create database wordpress;
create user 'wordpressuser'@'localhost' identified by 'qwerty';
grant all privileges on wordpress.* to 'wordpressuser'@'localhost';
flush privileges;
EOF
