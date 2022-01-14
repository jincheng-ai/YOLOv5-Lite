#!/usr/bin/make -f

IMAGE := yololite
VERSION := v1.0
SHM := 8G

.PHONY: build shell jupyter

jupyter:
	docker run --rm -it --gpus all --shm-size $(SHM) -p 8888:8888 -e DISPLAY=$(DISPLAY) -v ~/datas/multisensors20220113:/det/datas -v /tmp/.X11-unix:/tmp/.X11-unix --name="$(IMAGE)" $(IMAGE):$(VERSION) jupyter notebook --ip 0.0.0.0 --allow-root --port 8888 --no-browser
build:
	docker build -t=$(IMAGE):$(VERSION) -f Dockerfile . --network host
shell:
	docker run --rm -it --gpus all --shm-size $(SHM) -e DISPLAY=$(DISPLAY) -v ~/datas/multisensors20220113:/det/datas -v /tmp/.X11-unix:/tmp/.X11-unix --name="$(IMAGE)" $(IMAGE):$(VERSION) bash 
