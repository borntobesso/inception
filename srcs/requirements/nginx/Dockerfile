FROM debian:buster
RUN apt update
RUN apt upgrade
RUN apt install nginx -y
RUN apt install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=sojung.42.fr/UID=sojung"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/sites-available/default
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
EXPOSE 443
CMD [ "nginx", "-g", "daemon off;" ]