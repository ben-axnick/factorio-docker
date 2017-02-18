PROJECT = bentheax/factorio
VERSION = 0.14.22
IMAGE = $(PROJECT):$(VERSION)
IMAGE_LATEST = $(PROJECT):latest

.PHONY: build
build:
	docker build --rm -t $(IMAGE) game
	docker tag $(IMAGE) $(IMAGE_LATEST)

.PHONY: push
push:
	docker push $(IMAGE)
	docker push $(IMAGE_LATEST)

.PHONY: run
run:
	docker-compose run game
