IMAGENAME := srwalker101/kaggle-steel
DOCKER := docker

all: build

build: Dockerfile
	${DOCKER} build -t ${IMAGENAME} .

shell: build
	${DOCKER} run --gpus all --rm -it -u $(shell id -u):$(shell id -g) -v $(shell pwd):/workspace ${IMAGENAME} bash

rootshell: build
	${DOCKER} run --gpus all --rm -it -v $(shell pwd):/workspace ${IMAGENAME} bash

run: build
	${DOCKER} run --gpus all --rm -it -u $(shell id -u):$(shell id -g) -v $(shell pwd):/workspace -p 8888:8888 ${IMAGENAME} /workspace/runjupyter.sh
