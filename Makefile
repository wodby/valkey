-include env_make

VALKEY_VER ?= 9.0.0
VALKEY_VER_MINOR = $(shell echo "${VALKEY_VER}" | grep -oE '^[0-9]+\.[0-9]+')

TAG ?= $(VALKEY_VER_MINOR)

REPO = wodby/valkey
NAME = valkey-$(VALKEY_VER)

PLATFORM ?= linux/arm64

ifneq ($(ARCH),)
	override TAG := $(TAG)-$(ARCH)
endif

.PHONY: build buildx-build buildx-push test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) \
		--build-arg VALKEY_VER=$(VALKEY_VER) \
		./

buildx-build:
	docker buildx build --platform $(PLATFORM) -t $(REPO):$(TAG) \
		--build-arg VALKEY_VER=$(VALKEY_VER) \
		--load \
		./

buildx-push:
	docker buildx build --platform $(PLATFORM) --push -t $(REPO):$(TAG) \
		--build-arg VALKEY_VER=$(VALKEY_VER) \
		./

buildx-imagetools-create:
	docker buildx imagetools create -t $(REPO):$(TAG) \
				$(REPO):$(VALKEY_VER_MINOR)-amd64 \
				$(REPO):$(VALKEY_VER_MINOR)-arm64
.PHONY: buildx-imagetools-create

test:
	cd ./tests && IMAGE=$(REPO):$(TAG) NAME=$(NAME) ./run.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) -e DEBUG=1 $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
