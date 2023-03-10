WORKDIR = ./srcs
DOCKER_COMPOSE_F = $(WORKDIR)/docker-compose.yml
ENV = $(WORKDIR)/.env

all: build up

build: 
		docker-compose -f $(DOCKER_COMPOSE_F) build
stop:
		docker-compose -f $(DOCKER_COMPOSE_F) stop
down:
		docker-compose -f $(DOCKER_COMPOSE_F) down
		sudo rm -rf /home/aaggoujj/data/*
up:
		mkdir -p /home/aaggoujj/data/mariadb
		mkdir -p /home/aaggoujj/data/wordpress
		mkdir -p /home/aaggoujj/data/portainer
		docker-compose -f $(DOCKER_COMPOSE_F) up -d
fclean: down
clean: stop
re : down all

logs:
	docker-compose -f $(DOCKER_COMPOSE_F) logs -f

.PHONY: up stop start build down fclean clean all