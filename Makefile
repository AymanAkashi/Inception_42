WORKDIR = ./srcs
DOCKER_COMPOSE_F = $(WORKDIR)/docker-compose.yml
ENV = $(WORKDIR)/.env

build: 
		docker-compose -f $(DOCKER_COMPOSE_F) build

start:
		docker-compose $(DOCKER_COMPOSE_F) up -d

stop:
		docker-compose -f $(DOCKER_COMPOSE_F) stop
down:
		docker-compose -f $(DOCKER_COMPOSE_F) down
up:
		docker-compose -f $(DOCKER_COMPOSE_F) --env-file $(ENV) up


.PHONY: up stop start build