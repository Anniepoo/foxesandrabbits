# Logtalk foxes and bunnies example

# Force shell to be Bash.

SHELL := /bin/bash

.PHONY: run

run:
	swilgt -g {loader}.

.PHONY: test

test:
	swilgt -g {tester}.

.PHONY: makedocs
	
makedocs:
	swilgt -g "({loader},lgtdoc::directory('.')),halt."
	cd ./xml_docs && lgt2html -d ../docs
