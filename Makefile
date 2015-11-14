SHELL := /bin/bash
MAKEFILE_RULES := $(shell cat Makefile | grep "^[A-Za-z]" | awk '{print $$1}' | sed "s/://g" | sort -u)

.SILENT: help
.PHONY: $(MAKEFILE_RULES)

default: help

galaxy: ## Pull Ansible Galaxy roles now
galaxy:
		ansible-galaxy install -r requirements.yml --force

update:  ## Update astra-logging-ansible from master and install Galaxy roles
update:
		git pull --rebase origin master
		rm -rf ./playbooks/roles/galaxy_*
		ansible-galaxy install -r requirements.yml

help:  ## This help dialog.
	echo "                _         __ _ _        "
	echo "    /\/\   __ _| | _____ / _(_) | ___   "
	echo "   /    \ / _' | |/ / _ \ |_| | |/ _ \  "
	echo "  / /\/\ \ (_| |   <  __/  _| | |  __/  "
	echo "  \/    \/\__,_|_|\_\___|_| |_|_|\___|  "
	echo "    You can run the following commands from this$(MAKEFILE_LIST):"
	IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sort`) ; \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done
