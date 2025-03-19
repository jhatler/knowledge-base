# SPDX-License-Identifier: MIT
# Origin: https://github.com/thomvaill/tads-boilerplate

# Preserve intermediate files
.SECONDARY:

README.md: templates/README.md.j2 data.yml
	@python3 render.py $< $@ $(filter-out $<, $^)

#:## Clean
clean: ## Clean all generated files
	@rm -f README.md

#:## Default Targets
.PHONY: all help

# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help: ## This help
	@awk 'BEGIN { \
		print "LaTeX Makefile";\
	\
		FS = ":.*?## "} \
	/^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2} \
	/^#:## / {printf "\n\033[35m%s\033[0m\n", $$2} ' \
	$(MAKEFILE_LIST)

all: README.md ## Default target to generate README.md

.DEFAULT_GOAL := README.md
