IMAGE_NAME=pycat

#
# develop
#

images:
	docker build -t ${IMAGE_NAME} .

shell:
	docker run -it --rm -v $(PWD):/project ${IMAGE_NAME} /bin/bash

test:
	docker run --rm -v $(PWD):/project ${IMAGE_NAME} ./test/suite

lint:
	docker run --rm -v $(PWD):/project ${IMAGE_NAME} yapf -r -i -vv .
	docker run --rm -v $(PWD):/project ${IMAGE_NAME} pipenv check --system

#
# deploy
#

artifacts:
	make images test lint >&2 && echo ${IMAGE_NAME}

#
# utilities
#

phony:
	@sed -ne 's/^\([[:alnum:]_-]\{1,\}\):.*/	\1 \\/p' Makefile | sed -e '$$s/ \\//'

.PHONY: \
	images \
	shell \
	test \
	lint \
	artifacts \
	phony
