#
AUTHOR=obezpalko@gmail.com
PROJECT=$(shell basename $(shell pwd))
RUNNED=.runned
IMAGE=.image
.DEFAULT_GOAL=.image

image: $(IMAGE)

Dockerfile: 
	@touch $@

$(IMAGE): Dockerfile
	@sudo docker build --tag="$(AUTHOR)/$(PROJECT)" ./
	@sudo docker images -q $(AUTHOR)/$(PROJECT) > $(IMAGE)

run:
	@sudo docker run -d -P \
		--name=$(shell sed '/TARGET_IMAGE_NAME/!d; s/^.*TARGET_IMAGE_NAME \([^:]*\):.*$$/\1/' Dockerfile ) \
		-v /var/container_data/elasticsearch/log:/var/log/elasticsearch/ \
		-v /var/container_data/elasticsearch/etc/elasticsearch:/etc/elasticsearch/ \
		-v /var/container_data/elasticsearch/lib:/var/lib/elasticsearch/ \
		$(AUTHOR)/$(PROJECT) > $(RUNNED)

run_bash:
	@sudo docker run -it -P \
		-v /var/c/docker_data/elasticsearch/log:/var/log/elasticsearch/ \
		-v ~obezpalko/docker_data/elasticsearch/etc/elasticsearch:/etc/elasticsearch/ \
		-v ~obezpalko/docker_data/elasticsearch/lib:/var/lib/elasticsearch/ \
		$(AUTHOR)/$(PROJECT) \
		/bin/bash

start stop kill inspect logs:
	@sudo docker $@ `cat $(RUNNED)`

ps:
	@sudo docker ps

clean: stop
	@sudo docker rm `cat $(RUNNED)`
	@sudo docker rmi `cat $(IMAGE)`
	@rm $(RUNNED) $(IMAGE)

ns connect: start
	@sudo nsenter --target $(shell sudo docker inspect --format {{.State.Pid}} $(shell cat $(RUNNED))) --mount --uts --ipc --net --pid
	@exit

exec: start
	@sudo docker $@ -ti `cat $(RUNNED)` bash
