#
PROJECT=$(shell basename $(shell pwd))
RUNNED=.runned
IMAGE=.image
.DEFAULT_GOAL=.image
CONTAINER=$(shell sed '/TARGET_IMAGE_NAME/!d; s/^.*TARGET_IMAGE_NAME\s\s*\([^:]*\):.*$$/\1/' Dockerfile )
TARGET_IMAGE_NAME=$(shell sed '/TARGET_IMAGE_NAME/!d; s/^.*TARGET_IMAGE_NAME\s\s*//' Dockerfile )

image: $(IMAGE)

Dockerfile:
	@touch $@

$(IMAGE): Dockerfile
	@docker build --tag="$(TARGET_IMAGE_NAME)" ./
	@echo $(TARGET_IMAGE_NAME)
	@docker images -q $(CONTAINER) > $(IMAGE)

push: image
	@docker push $(TARGET_IMAGE_NAME)

run: image
	@docker run -d -P \
		--name=$(CONTAINER) \
		$(TARGET_IMAGE_NAME) > $(RUNNED)

run_bash: image
	@docker run -it --rm -P \
		$(TARGET_IMAGE_NAME) \
		/bin/bash

start stop kill inspect logs:
	@[ -r $(RUNNED) ] && docker $@ `cat $(RUNNED)`

ps:
	@docker ps

clean: stop
	@docker rm `cat $(RUNNED)`
	@docker rmi `cat $(IMAGE)`
	@rm $(RUNNED) $(IMAGE)

ns connect: start
	@nsenter --target $(shell docker inspect --format {{.State.Pid}} $(shell cat $(RUNNED))) --mount --uts --ipc --net --pid
	@exit

exec: start
	@docker $@ -ti `cat $(RUNNED)` bash
