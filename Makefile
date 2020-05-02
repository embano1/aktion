IMAGE=embano1/hello-aktion

.PHONY: build push

default: push

login:
	echo ${DOCKER_SECRET} | docker login -u ${DOCKER_USER} --password-stdin

build: 
	docker build -t ${IMAGE}:${GITHUB_SHA} .

push: login build 
	docker push ${IMAGE}:${GITHUB_SHA}
