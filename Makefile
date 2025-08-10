REPO_ROOT := $(shell git rev-parse --show-toplevel)
RELEASE := $(shell cat $(REPO_ROOT)/release)
VERSIONS := $(shell cat $(REPO_ROOT)/versions)
BUILD_ARGS := $(foreach version,$(VERSIONS), --build-arg $(version))
DOCKER_REPO := "ronkitay"

define make_image
	printf "###########  Building image %s/%s:%s-%s  ###############\n" "$(DOCKER_REPO)" "${1}" "$(RELEASE)" "$(ARCHITECTURE)"
	echo ""

	echo "Using extra build args: $(EXTRA_BUILD_ARGS)"
	echo ""

	echo "Running command [docker build --platform linux/$(ARCHITECTURE) $(EXTRA_BUILD_ARGS) --build-arg ARCHITECTURE=$(ARCHITECTURE) --build-arg RELEASE=$(RELEASE) $(BUILD_ARGS) -t $(DOCKER_REPO)/${1}:$(RELEASE)-$(ARCHITECTURE) .]"
	echo ""

	cd ${1} && docker build --platform linux/$(ARCHITECTURE) $(EXTRA_BUILD_ARGS) --build-arg ARCHITECTURE=$(ARCHITECTURE)--build-arg RELEASE=$(RELEASE) --build-arg DOCKER_REPO=$(DOCKER_REPO) $(BUILD_ARGS) -t $(DOCKER_REPO)/${1}:$(RELEASE)-$(ARCHITECTURE) .

	echo ""
	printf "###########  Pushing image %s/%s:%s-%s  ###############\n" "$(DOCKER_REPO)" "${1}" "$(RELEASE)" "$(ARCHITECTURE)"
	docker push $(DOCKER_REPO)/${1}:$(RELEASE)-$(ARCHITECTURE)

	echo ""
	printf "###########  Done with image %s/%s:%s-%s  ###############\n" "$(DOCKER_REPO)" "${1}" "$(RELEASE)" "$(ARCHITECTURE)"
	echo ""
endef

define make_manifest
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

### START IMAGES ###

## DB Clients

duckdb: 
	$(call make_image,duckdb)

mongo-client: 
	$(call make_image,mongo-client)

## Other Environments

basic-env: 
	$(call make_image,basic-env)

k8s-cli: 
	$(call make_image,k8s-cli)

eks: 
	$(call make_image,eks)

go-env: basic-env
	$(call make_image,go-env)

jsqsh: basic-env
	$(call make_image,jsqsh)


node-14-env: basic-env
	$(call make_image,node-14-env)

node-16-env: basic-env
	$(call make_image,node-16-env)

lua-5.4-env: basic-env
	$(call make_image,lua-5.4-env)


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

### END IMAGES ###

### START MANIFESTS ###

duckdb-manifest: 
	$(call make_manifest,duckdb)

mongo-client-manifest: 
	$(call make_manifest,mongo-client)

basic-env-manifest: 
	$(call make_manifest,basic-env)

k8s-cli-manifest: 
	$(call make_manifest,k8s-cli)

eks-manifest: 
	$(call make_manifest,eks)

### END MANIFESTS ###

build-all-images: duckdb mongo-client basic-env k8s-cli eks

create-all-manifests: duckdb-manifest mongo-client-manifest basic-env-manifest k8s-cli-manifest eks-manifest
