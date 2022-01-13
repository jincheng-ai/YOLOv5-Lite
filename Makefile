#!/usr/bin/make -f

IMAGE := yololite
VERSION := latest
SHM := 8G

.PHONY: build shell

build:
	docker build -t=$(IMAGE):$(VERSION) -f Dockerfile . --network host
shell:
	docker run --rm -it --gpus all --shm-size $(SHM) -e DISPLAY=$(DISPLAY) -v ~/datas/multisensors20220113:/det/datas -v /tmp/.X11-unix:/tmp/.X11-unix --name="$(IMAGE)" $(IMAGE):$(VERSION) bash 
