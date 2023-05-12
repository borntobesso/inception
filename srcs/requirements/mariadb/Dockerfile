FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

COPY ./conf/my.cnf	/etc/mysql
COPY ./tools/init_db.sh	/tmp/
RUN chmod +x /tmp/init_db.sh

CMD ["/tmp/init_db.sh"]