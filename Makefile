# Makefile

.DEFAULT_GOAL := all

build:
	docker-compose up --build -d && \
	docker exec -it tutorial1_container bash

all:
	docker-compose up --build -d && \
	docker exec -it tutorial1_container bash

exec:
	docker exec -it tutorial1_container bash


up:
	docker-compose up
dwn:
	docker-compose down

.PHONY: build up down
