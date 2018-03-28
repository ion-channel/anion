SHELL = bash

NO_COLOR := \033[0m
INFO_COLOR := \033[0;36m

CI_BRANCH ?= $(CIRCLE_BRANCH)

.PHONY: ci
ci: linters test ## Run ci

.PHONY: ci_setup
ci_setup: ## Setup the ci environment
	@if [[ -n "$$BUILD_ENV" ]] && [[ "$$BUILD_ENV" == "testing" ]]; then echo -e "$(INFO_COLOR)THIS IS EXECUTING AGAINST THE TESTING ENVIRONMEMNT$(NO_COLOR)"; fi

.PHONY: clean
clean:  ## Cleanup all running and generated items
	-@rm -rf build

.PHONY: deploy
deploy: ## Deploy the projects
	@if [ "$(CI_BRANCH)" == "master" ]; then \
		echo "Deploy disabled for now"; \
	fi

.PHONY: help
help:  ## Show This Help
	@for line in $$(cat Makefile | grep "##" | grep -v "grep" | sed  "s/:.*##/:/g" | sed "s/\ /!/g"); do verb=$$(echo $$line | cut -d ":" -f 1); desc=$$(echo $$line | cut -d ":" -f 2 | sed "s/!/\ /g"); printf "%-30s--%s\n" "$$verb" "$$desc"; done

.PHONY: install
install: ## Install dependencies
	yarn install

.PHONY: linters
linters: ## Run all linters
	yarn run eslint lib/**

.PHONY: test
test: unit_test  ## Run all tests available

.PHONY: unit_test
unit_test:  ## Run unit tests
	yarn run mocha --require babel-core/register "lib/**/*.test.js"
