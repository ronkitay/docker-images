REPO_ROOT := $(shell git rev-parse --show-toplevel)
RELEASE := $(shell cat $(REPO_ROOT)/release)
VERSIONS := $(shell cat $(REPO_ROOT)/versions)
BUILD_ARGS := $(foreach version,$(VERSIONS), --build-arg $(version))
DOCKER_REPO := "ronkitay"
ARCHITECTURE := $(shell docker version --format '{{.Server.Arch}}')

define docker_login
	echo "Skipping for github" 
	echo "docker login --username $(DOCKERHUB_USERNAME) --password-stdin < $(echo ${DOCKERHUB_TOKEN})""
endef

define make_image
	echo   "##########################################################"
	printf "###########  Making image %-15s  ###############\n" "${1}"
	echo ""

	echo "Using release: $(RELEASE)"
	echo "Using docker repo: $(DOCKER_REPO)"
	echo "Using build args: $(BUILD_ARGS)"
	echo ""
	echo "Using extra build args: $(EXTRA_BUILD_ARGS)"
	echo ""

	echo "Using architecture: $(ARCHITECTURE)"
	echo ""

	echo "Running command [docker build --platform linux/$(ARCHITECTURE) $(EXTRA_BUILD_ARGS) --build-arg RELEASE=$(RELEASE) $(BUILD_ARGS) -t $(DOCKER_REPO)/${1}:$(RELEASE)-$(ARCHITECTURE) .]"
	echo ""

	cd ${1} && docker build --platform linux/$(ARCHITECTURE) $(EXTRA_BUILD_ARGS) --build-arg RELEASE=$(RELEASE) --build-arg DOCKER_REPO=$(DOCKER_REPO) $(BUILD_ARGS) -t $(DOCKER_REPO)/${1}:$(RELEASE)-$(ARCHITECTURE) .

	echo ""
	printf "###########  Pushing image %-15s  ###############\n" "${1}"
	docker push $(DOCKER_REPO)/${1}:$(RELEASE)-$(ARCHITECTURE)

	echo ""
	printf "##########  Done with image %-15s  #############\n" "${1}"
	echo "##########################################################"
	echo ""
endef

docker-login:
	$(call docker_login)

basic-env: docker-login
	$(call make_image,basic-env)

duckdb: basic-env
	$(call make_image,duckdb)

eks: k8s-cli
	$(call make_image,eks)

go-env: basic-env
	$(call make_image,go-env)

jsqsh: basic-env
	$(call make_image,jsqsh)

k8s-cli: basic-env
	$(call make_image,k8s-cli)

node-14-env: basic-env
	$(call make_image,node-14-env)

node-16-env: basic-env
	$(call make_image,node-16-env)

lua-5.4-env: basic-env
	$(call make_image,lua-5.4-env)

mongo-client: docker-login
	$(call make_image,mongo-client)

postgres-cli: basic-env
	$(call make_image,postgres-cli)

mysql-cli: basic-env
	$(call make_image,mysql-cli)

python-3-env: basic-env
	$(call make_image,python-3-env)

rust-env: basic-env
	$(call make_image,rust-env)

vector: basic-env
	$(call make_image,vector)

all: duckdb eks go-env jsqsh k8s-cli lua-5.4-env mongo-client mysql-cli node-14-env node-16-env postgres-cli python-3-env rust-env vector
	echo "#######################################################"
	echo "###########  ALL IMAGES BUILT  ########################"
	echo "#######################################################"

build-all-images: mongo-client

define make_manifest
	echo   "##########################################################"
	printf "###########  Making Manifest %-15s  ###############\n" "${1}"
	echo ""

	docker manifest create $(DOCKER_REPO)/${1}:$(RELEASE) \
		$(DOCKER_REPO)/${1}:$(RELEASE)-amd64 \
		$(DOCKER_REPO)/${1}:$(RELEASE)-arm64 \
		--amend

	docker manifest annotate $(DOCKER_REPO)/${1}:$(RELEASE) $(DOCKER_REPO)/${1}:$(RELEASE)-amd64 --os linux --arch amd64
	docker manifest annotate $(DOCKER_REPO)/${1}:$(RELEASE) $(DOCKER_REPO)/${1}:$(RELEASE)-arm64 --os linux --arch arm64
	
	docker manifest push $(DOCKER_REPO)/${1}:$(RELEASE)
endef

mongo-client-manifest: docker-login
	$(call make_manifest,mongo-client)

create-all-manifests: mongo-client-manifest
