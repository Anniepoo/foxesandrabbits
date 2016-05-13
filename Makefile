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

makediagrams:
	swilgt -g "({loader},diagrammaker::make_diagrams),halt."
	cd ./docs/dot && dot -Tsvg foxesandrabbits_entity_diagram.dot >foxesandrabbits_entity_diagram.svg
	cd ./docs/dot && dot -Tsvg foxesandrabbits_file_load_diagram.dot >foxesandrabbits_file_load_diagram.svg
	cd ./docs/dot && dot -Tsvg foxesandrabbits_entity_diagram.dot >foxesandrabbits_entity_diagram.svg
	cd ./docs/dot && dot -Tsvg foxesandrabbits_inheritance_diagram.dot >foxesandrabbits_inheritance_diagram.svg
	cd ./docs/dot && dot -Tsvg foxesandrabbits_uses_diagram.dot >foxesandrabbits_uses_diagram.svg
	cd ./docs/dot && dot -Tsvg foxesandrabbits_file_dependency_diagram.dot >foxesandrabbits_file_dependency_diagram.svg
	cd ./docs/dot && dot -Tsvg foxesandrabbits_xref_diagram.dot >foxesandrabbits_xref_diagram.svg
	cd ./docs/dot && dot -Tsvg field_object_xref_diagram.dot >field_object_xref_diagram.svg
