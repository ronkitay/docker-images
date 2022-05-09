REPO_ROOT := $(shell git rev-parse --show-toplevel)
RELEASE := $(shell cat $(REPO_ROOT)/release)
VERSIONS := $(shell cat $(REPO_ROOT)/versions)
BUILD_ARGS := $(foreach version,$(VERSIONS), --build-arg $(version))

all: prepare build

prepare:
	test -f prepare.mk && make --makefile=prepare.mk || echo "skipping"

build:
	RELEASE=$(RELEASE) BUILD_ARGS='$(BUILD_ARGS)' make --makefile=../build.mk
