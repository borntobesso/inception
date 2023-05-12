DATA_PATH	=	/home/sojung/data

DOCKER		=	sudo docker

COMPOSE		=	sudo docker compose -f srcs/docker-compose.yml

HOSTS_PATH	=	/etc/hosts

HOST_NAME	=	127.0.0.1 sojung.42.fr

init	:
			mkdir -p $(DATA_PATH)/wp_data
			mkdir -p $(DATA_PATH)/mariadb_data
			sudo chmod 777 $(HOSTS_PATH)
			echo "$(HOST_NAME)" >> $(HOSTS_PATH)

build	:
			$(COMPOSE) up --build -d

all		:	init build

clean	:
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean	:	clean
			$(DOCKER) system prune --volumes --all --force
			sudo rm -rf $(DATA_PATH)/wp_data
			sudo rm -rf $(DATA_PATH)/mariadb_data
			$(DOCKER) network prune --force
			$(DOCKER) image prune --force
			sudo sed -i '/$(HOST_NAME)/d' $(HOSTS_PATH)

re		:	fclean all