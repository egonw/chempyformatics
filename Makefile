SOURCES := src/atomsbonds.i.md
TARGETS := docs/atomsbonds.md

all: ${TARGETS}
	@cp code/*.ipynb docs/nb/.

clean:
	@rm -f ${TARGETS}

references.qids: findCitations.groovy ${SOURCES}
	@echo "Finding the citations"
	@groovy findCitations.groovy . | grep "^Q" | sort | uniq > references.qids

references.dat: references.qids references.js
	@node references.js

docs/%.md : src/%.i.md createMarkdown.groovy
	@echo "Creating $@"
	@groovy createMarkdown.groovy $< > $@

