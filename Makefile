.ONESHELL:
.PHONY: all help

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

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

lint: ## ansible-lint
	@$(LINT) .

syntax: ## ansible-playbook syntax-check
	@$(ANSIBLEPB) tests/test.yml --syntax-check
