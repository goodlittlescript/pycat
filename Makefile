IMAGE_NAME=pycat

#
# Development
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
# Utilities
#

phony:
	@sed -ne 's/^\([[:alnum:]]\{1,\}\):/	\1 \\/p' Makefile

.PHONY: \
	images \
	shell \
	test \
	lint \
	phony \
