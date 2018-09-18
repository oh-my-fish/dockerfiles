DOCKERFILES = $(wildcard fish/*/Dockerfile)

.PHONY: all FORCE

all: $(DOCKERFILES)

fish/%/Dockerfile: FORCE
	docker build -t ohmyfish/fish:$* fish/$*

FORCE:
