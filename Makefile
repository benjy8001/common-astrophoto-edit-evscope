#!/usr/bin/env bash

ifndef VERBOSE
.SILENT:
endif

DOCKER          = docker

#
# Presentation commands
# -------------------
#
coffee:
	printf "\033[32m You can go take a coffee while we work for you \033[0m\n"

banner:
	printf "\033[95m ASTROPHOTO TOOLS FROM EVSCOPE\n"
#
.DEFAULT_GOAL := help
help:banner ## this help
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/  \x1b\[32m##/\x1b\[33m/'
.PHONY: help coffee banner

##
## Project
## -------
build: ## Build docker
	printf "\033[32m Deploy to Server \033[0m\n"
	$(DOCKER) build -f Dockerfile . -t astrophoto-edit-tools

run: build ## Run project
	printf " 🏃\033[33m Running application ... \033[0m\n"
	$(DOCKER) run --rm -it -v `pwd`/:/project astrophoto-edit-tools /bin/bash

start: run vendor assets migrate ## Run project