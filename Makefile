.ONESHELL:
.PHONY: all help init update test

# find bundle
BUNDLE := $(shell which bundle)
ifndef BUNDLE
  $(error Bundler not installed: gem install bundler)
endif

# find ansible-lint
LINT := $(shell which ansible-lint)
ifndef LINT
  $(error ansible-lint not installed: pip install ansible-lint)
endif

# find ansible-playbook
ANSIBLEPB := $(shell which ansible-playbook)
ifndef ANSIBLEPB
	$(error ansible-playbook not installed: pip install ansible)
endif

# project directory
PROJECT_ROOT :=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

converge: ## kitchen converge
	@$(BUNDLE) exec kitchen converge

create: ## kitchen create
	@$(BUNDLE) exec kitchen create

destroy: ## kitchen destroy
	@$(BUNDLE) exec kitchen destroy

lint: ## ansible-lint
	@$(LINT) .

list: ## kitchen list
	@$(BUNDLE) exec kitchen list

login: ## kitchen login
	@$(BUNDLE) exec kitchen login

setup: ## Install needed gems for test-kitchen
	@$(BUNDLE) install

syntax: ## ansible-playbook syntax-check
	@ANSIBLE_ROLES_PATH=$(PROJECT_ROOT)/.. $(ANSIBLEPB) test/integration/default/default.yml --syntax-check

test: ## kitchen test
	@$(BUNDLE) exec kitchen test

verify: ## kitchen verify
	@$(BUNDLE) exec kitchen verify
