REPO_ROOT := $(shell git rev-parse --show-toplevel)
RELEASE := $(shell cat $(REPO_ROOT)/release)
VERSIONS := $(shell cat $(REPO_ROOT)/versions)
BUILD_ARGS := $(foreach version,$(VERSIONS), --build-arg $(version))

define make_image
	echo   "##########################################################"
	printf "###########  Making image %-15s  ###############\n" "${1}"
	echo ""
	
	cd ${1} && docker build --build-arg RELEASE=$(RELEASE) $(BUILD_ARGS) -t ${1}:$(RELEASE) .

	echo ""
	printf "##########  Done with image %-15s  #############\n" "${1}"
	echo "##########################################################"
	echo ""
endef

basic-env: 
	$(call make_image, basic-env)

eks: k8s-cli
	$(call make_image, eks)

go-env: basic-env
	$(call make_image, go-env)

jsqsh: basic-env
	$(call make_image, jsqsh)

k8s-cli: basic-env
	$(call make_image, k8s-cli)

lua-5.4-env: basic-env
	$(call make_image, lua-5.4-env)

mongo-client: basic-env
	$(call make_image, mongo-client)

postgres-cli: basic-env
	$(call make_image, postgres-cli)
	
python-3.9-env: basic-env
	$(call make_image, python-3.9-env)

vector: basic-env
	$(call make_image, vector)

all: eks go-env jsqsh k8s-cli lua-5.4-env mongo-client postgres-cli python-3.9-env vector 
	echo "#######################################################"
	echo "###########  ALL IMAGES BUILT  ########################"
	echo "#######################################################"
