SHELL = bash
export PATH := $(HOME)/.local/bin:$(PATH)

NO_COLOR := \033[0m
INFO_COLOR := \033[0;36m

APP := $(shell basename $(PWD) | tr '[:upper:]' '[:lower:]')
DATE := $(shell date -u +%Y-%m-%d%Z%H:%M:%S)

CI_BRANCH ?= $(CIRCLE_BRANCH)

.PHONY: ci_setup
ci_setup: ## Setup the ci environment
	@if [[ -n "$$BUILD_ENV" ]] && [[ "$$BUILD_ENV" == "testing" ]]; then echo -e "$(INFO_COLOR)THIS IS EXECUTING AGAINST THE TESTING ENVIRONMEMNT$(NO_COLOR)"; fi
	@echo "Installing AWS cli"
	@wget -O flow.tar.gz https://github.com/gomicro/flow/releases/download/v0.0.1/flow_0.0.1_linux_amd64.tar.gz
	@tar xvf flow.tar.gz -C /home/travis/.local/bin

.PHONY: clean
clean: clean_files  ## Cleanup all running and generated items
	@docker-compose down

.PHONY: clean_files
clean_files: ## Clean up the generated files
	-@rm -rf build

.PHONY: deploy
deploy: ## Deploy the projects
	@if [ "$(CI_BRANCH)" == "master" ]; then \
		echo "Deploy disabled for now"; \
	fi

.PHONY: ecr_login
ecr_login:  ## Login to the ECR using local credentials
	@eval $$(flow aws ecr auth)

.PHONY: help
help:  ## Show This Help
	@for line in $$(cat Makefile | grep "##" | grep -v "grep" | sed  "s/:.*##/:/g" | sed "s/\ /!/g"); do verb=$$(echo $$line | cut -d ":" -f 1); desc=$$(echo $$line | cut -d ":" -f 2 | sed "s/!/\ /g"); printf "%-30s--%s\n" "$$verb" "$$desc"; done

.PHONY: install
install: ## Install dependencies
	npm install

.PHONY: linters
linters: ## Run all linters
	npx eslint lib/**

.PHONY: logs
logs:  ## Capture logs for services
	@mkdir serverLogs
	@docker ps -a > "serverLogs/docker.txt"
	@for server in $$(docker ps -a --format '{{.Names}}'); do docker logs "$$server" > "serverLogs/$$server.txt"; done

.PHONY: pretty
pretty: ## checks that all js files are formatted
	npx prettier -c "lib/**/*.js"

.PHONY: run
run: ecr_login ## Run a dockerized version of the app
	docker-compose up -d
	@if [[ -n "$$(docker ps -a --format '{{.Names}} {{.Status}}' | grep Exited | grep -v 'Exited (0)')" ]]; then echo "One of the containers exited poorly"; exit 1; fi
	@timeout=120; while [[ "$$(docker ps -a --format '{{.Names}} {{.Status}}' | grep -v \(healthy\) | grep -v Exited | grep -v api |  grep -v elasticmq)" && $$timeout -gt 0 ]]; do echo -n "."; sleep 1; let $$(( timeout-- )); done; if [[ $$timeout == 0 ]]; then echo "reached timeout"; exit 1; fi

.PHONY: test
test: unit_test integration_test ## Run all tests available

.PHONY: unit_test
unit_test:  ## Run unit tests
	@npx jest --config=jest.unit.config.js

.PHONY: integration_test
integration_test:  ## Run integration tests
	@npx jest --config=jest.integration.config.js