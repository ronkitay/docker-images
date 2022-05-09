build:
	DOCKER_BUILDKIT=0 docker build --build-arg RELEASE=$(RELEASE) $(BUILD_ARGS) -t $(shell basename $(shell pwd)):$(RELEASE) .