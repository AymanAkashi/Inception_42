WORKDIR = ./srcs
DOCKER_COMPOSE_F = $(WORKDIR)/docker-compose.yml

build: 
		docker-compose -f $(DOCKER_COMPOSE_F) build

start:
		docker-compose $(DOCKER_COMPOSE_F) up -d

stop:
		docker-compose down
up:
	docker-compose -f $(DOCKER_COMPOSE_F) up

.PHONY: build-webserver up stop start build