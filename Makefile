VERSION := $(shell sh -c 'git describe --always --tags')

default: build

build:
	docker build -t objectpartners/rancher-vault:${VERSION} .

build-latest:
	docker build -t objectpartners/rancher-vault:latest .

publish:
	docker push objectpartners/rancher-vault:${VERSION}

publish-latest:
	docker push objectpartners/rancher-vault:latest
