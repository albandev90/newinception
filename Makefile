DIR = /home/${USER}

all: inception

inception:
	mkdir -p ${DIR}/data/mariadb
	mkdir -p ${DIR}/data/wordpress
	chmod 777 /home/almedetb/inception_git/srcs/requirements/mariadb/tools/docker_entry.sh
	chmod 777 /home/almedetb/inception_git/srcs/requirements/wordpress/tools/docker_entry.sh
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all -v --remove-orphans 2>/dev/null || true

fclean: clean
	rm -rf ${DIR}/data/*
	docker rmi -f $$(docker images -a -q) 2> /dev/null || true
	docker volume prune -f

re: fclean all

.PHONY: all clean fclean re
