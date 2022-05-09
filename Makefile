basic-env: 
	cd basic-env && make

k8s-cli: basic-env
	cd k8s-cli && make

eks: k8s-cli
	cd eks && make

go-env: basic-env
	cd go-env && make

jsqsh: basic-env
	cd jsqsh && make

mongo-client: basic-env
	cd mongo-client && make

postgres-cli: basic-env
	cd postgres-cli && make

vector: basic-env
	cd vector && make

all: k8s-cli eks go-env jsqsh mongo-client postgres-cli vector
	echo "Done"
