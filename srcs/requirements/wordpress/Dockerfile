FROM debian:buster
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y wget
RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	php-cli\
	php-mbstring\
	php-xml\
	vim
RUN wget https://fr.wordpress.org/wordpress-6.1-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.1-fr_FR.tar.gz && rm wordpress-6.1-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/setup_wp.sh /tmp
RUN chmod +x /tmp/setup_wp.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html/wordpress
RUN mkdir -p /run/php

WORKDIR /var/www/html/wordpress

CMD [ "sh", "/tmp/setup_wp.sh" ]