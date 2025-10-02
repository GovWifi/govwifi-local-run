NO_CACHE:=
BUNDLE_FLAGS =  $(NO_CACHE) --build-arg BUNDLE_INSTALL_CMD='bundle install --jobs 20 --retry 5'
DOCKER_COMPOSE = docker compose -f docker-compose.yml
DOCKER_BUILD_CMD = $(DOCKER_COMPOSE) build $(BUNDLE_FLAGS)

.DEFAULT_GOAL := all

.PHONY: all
all:
	echo "Please choose a make target to run. E.g. make serve"

.PHONY: user-db
user-db:
	$(DOCKER_COMPOSE) build $(NO_CACHE) user-db

.PHONY: build-user-signup-api
build-user-signup-api:
	$(DOCKER_BUILD_CMD) user-signup-api

.PHONY: build-authentication-api
build-authentication-api:
	$(DOCKER_BUILD_CMD) authentication-api

build: user-db build-user-signup-api build-authentication-api

.PHONY: stop
stop:
	$(DOCKER_COMPOSE) down -v

.PHONY: serve
serve:
	$(DOCKER_COMPOSE) up

.PHONY: start
start: serve

.PHONY: user-signup-shell
user-signup-shell: serve
	$(DOCKER_COMPOSE) exec user-signup-shell /bin/sh
