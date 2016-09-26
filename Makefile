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

help:
        @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

converge: ## kitchen converge
        @$(BUNDLE) exec kitchen converge

create: ## kitchen create
        @$(BUNDLE) exec kitchen create

lint: ## ansible-lint
      @$(LINT) .

list: ## kitchen list
        @$(BUNDLE) exec kitchen list

login: ## kitchen login
        @$(BUNDLE) exec kitchen login

setup: ## Install needed gems for test-kitchen
        @$(BUNDLE) install

test: ## kitchen test
        @$(BUNDLE) exec kitchen test

verify: ## kitchen verify
        @$(BUNDLE) exec kitchen verify
