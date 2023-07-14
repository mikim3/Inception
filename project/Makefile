
all : up

up :
	@docker compose -f ./srcs/docker-compose.yml up -d

down :
	@docker compose -f ./srcs/docker-compose.yml down
	@docker compose -f ./srcs/docker-compose.yml down --volumes

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

start :
	@docker compose -f ./srcs/docker-compose.yml start

down-volumes :
	@docker compose -f ./srcs/docker-compose.yml down --volumes
