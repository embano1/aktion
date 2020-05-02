IMAGE=embano1/hello-aktion

PHONY: build push

default: push

login:
	docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD}

build: 
	docker build -t ${IMAGE}:${GITHUB_SHA} .

push:
	docker push ${IMAGE}:${GITHUB_SHA}
