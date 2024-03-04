.DEFAULT_GOAL := help

ENV_PREFIX ?= ./
ENV_FILE := $(wildcard $(ENV_PREFIX)/.env)

ifeq ($(strip $(ENV_FILE)),)
$(info $(ENV_PREFIX)/.env file not found, skipping inclusion)
else
include $(ENV_PREFIX)/.env
export
endif

GIT_SHA_SHORT = $(shell git rev-parse --short HEAD)
GIT_REF = $(shell git rev-parse --abbrev-ref HEAD)

#-------
##@ help
#-------

# based on "https://gist.github.com/prwhite/8168133?permalink_comment_id=4260260#gistcomment-4260260"
help: ## Display this help. (Default)
	@grep -hE '^(##@|[A-Za-z0-9_ \-]*?:.*##).*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?## "}; /^##@/ {print "\n" substr($$0, 5)} /^[A-Za-z0-9_ \-]*?:.*##/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

help-sort: ## Display alphabetized version of help (no section headings).
	@grep -hE '^[A-Za-z0-9_ \-]*?:.*##.*$$' $(MAKEFILE_LIST) | sort | \
	awk 'BEGIN {FS = ":.*?## "}; /^[A-Za-z0-9_ \-]*?:.*##/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

HELP_TARGETS_PATTERN ?= test
help-targets: ## Print commands for all targets matching a given pattern. eval "$(make help-targets HELP_TARGETS_PATTERN=test | sed 's/\x1b\[[0-9;]*m//g')"
	@make help-sort | awk '{print $$1}' | grep '$(HELP_TARGETS_PATTERN)' | xargs -I {} printf "printf '___\n\n{}:\n\n'\nmake -n {}\nprintf '\n'\n"

#--------------------------
##@ download csl bibliography style files
#--------------------------

# list of citation style names to vendor
CITATION_STYLES = \
	nature-no-superscript \
	springer-basic-author-date \
	springer-basic-brackets-no-et-al \
	springer-humanities-author-date \
	springer-humanities-brackets \
	springer-mathphys-author-date \
	springer-mathphys-brackets \
	springer-vancouver

# base URL for downloading the citation styles
BASE_URL = https://www.zotero.org/styles/

CSL_PREFIX ?= _extensions/nature/csl

download-csl-files: ## Download citation style files. Pass FORCE=1 to download even if file exists.
	mkdir -p $(CSL_PREFIX)
	@$(foreach style,$(CITATION_STYLES),\
		if [ "$(FORCE)" = "1" ] || [ ! -f "$(CSL_PREFIX)/$(style).csl" ]; then \
			echo "downloading: $(style).csl"; \
			wget -O $(CSL_PREFIX)/$(style).csl $(BASE_URL)$(style); \
		else \
			echo "$(style).csl exists. skipping..."; \
		fi;)

render-latex: ## Render the article via LaTeX
	quarto render template.qmd --to nature-pdf

render: ## Render all article formats including pdf, html, and docx
	quarto render template.qmd --to all
