DOCKER_COMPOSE=docker compose

DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

build:
	mkdir -p /home/achahid-/data/database
	mkdir -p /home/achahid-/data/web
	@$(DOCKER_COMPOSE)  -f $(DOCKER_COMPOSE_FILE) up --build -d

kill:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) kill

down:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

clean:
	@$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v

fclean: clean
	rm -r /home/achahid-/data/database
	rm -r /home/achahid-/data/web
	docker system prune -a -f

restart: clean build

.PHONY: kill build down clean restart
