
all:
	docker build -t web-server-build .;
	docker rm --force web-server;
	docker run -p 8888:8000 --name web-server web-server-build;
