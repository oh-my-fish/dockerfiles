DOCKERFILES = $(wildcard fish/*/Dockerfile)

.PHONY: all FORCE

all: $(DOCKERFILES)

fish/%/Dockerfile: FORCE
	docker build -t ohmyfish/fish:$* fish/$*

build:
	docker build \
		--file fish/3.0.0/Dockerfile \
		--tag=fish-$$fish_version \
		--build-arg FISH_VERSION=$$fish_version \
		./

FORCE:
