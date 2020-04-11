#!/bin/sh

# Set the timezone. Base image does not contain the setup-timezone script, so an alternate way is used.
if [ "$CONTAINER_TIMEZONE" ]; then
    cp /usr/share/zoneinfo/${CONTAINER_TIMEZONE} /etc/localtime && \
	echo "${CONTAINER_TIMEZONE}" >  /etc/timezone && \
	echo "Container timezone set to: $CONTAINER_TIMEZONE"
fi

# chrony - NTP client/server - https://chrony.tuxfamily.org
# Force immediate synchronisation of the time and start the time-synchronization service.
# In order to be able to use ntpd in the container, it must be run with the SYS_TIME capability.
# In addition you may want to add the SYS_NICE capability, in order for ntpd to be able to modify its priority.
# ntpd -s

# Apache server name change
# if [ ! -z "$APACHE_SERVER_NAME" ]
# 	then
# 		sed -i "s/#ServerName www.example.com:80/ServerName $APACHE_SERVER_NAME/" /etc/apache2/httpd.conf
# 		echo "Changed server name to '$APACHE_SERVER_NAME'..."
# 	else
# 		echo "NOTICE: Change 'ServerName' globally and hide server message by setting environment variable >> 'APACHE_SERVER_NAME=your.server.name' in docker command or docker-compose file"
# fi

# enable xdebug coverage for testing with phpunit (already installed)
# if [ ! -z "$PHP_XDEBUG_ENABLED" ]
# 	then
# 		echo "Enable XDebug..."
# 		echo 'zend_extension=/usr/lib/php7/modules/xdebug.so' >> /etc/php7/php.ini;
# 		echo 'xdebug.coverage_enable=On' >> /etc/php7/php.ini;
# 		echo 'xdebug.remote_enable=1' >> /etc/php7/php.ini;
# 		echo 'xdebug.remote_connect_back=1' >> /etc/php7/php.ini;
# 		echo 'xdebug.remote_log=/tmp/xdebug.log' >> /etc/php7/php.ini;
# 		echo 'xdebug.remote_autostart=true' >> /etc/php7/php.ini;
# fi

# Start (ensure apache2 PID not left behind first) to stop auto start crashes if didn't shut down properly

echo "Clearing any old processes..."
rm -f /run/apache2/apache2.pid
rm -f /run/apache2/httpd.pid

echo "Starting apache..."
# httpd -D FOREGROUND
exec /usr/sbin/httpd -D FOREGROUND -f /etc/apache2/httpd.conf &
exec /usr/sbin/php-fpm7 -F
