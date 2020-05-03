IMAGE=embano1/hello-aktion
TAG=$(subst refs/tags/,,${GITHUB_REF})

.PHONY: build push

default: push

login:
	@echo $(value DOCKER_SECRET) | docker login -u "${DOCKER_USER}" --password-stdin

build: 
	docker build -t ${IMAGE}:${TAG} .

push: login build 
	docker push ${IMAGE}:${TAG}
