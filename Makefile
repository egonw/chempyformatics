L10N :=
LANGS ?= en ${L10N}

SOURCES := src/atomsbonds.i.md src/index.i.md
TARGETS := docs/atomsbonds.md docs/index.md

all: ${TARGETS}
	@cp code/*.ipynb docs/nb/.
	@cp code/*.code.md docs/code/.

clean:
	@rm -f ${TARGETS}

references.qids: findCitations.groovy ${SOURCES}
	@echo "Finding the citations"
	@groovy findCitations.groovy . | grep "^Q" | sort | uniq > references.qids

references.dat: references.qids references.js
	@node references.js

sections.txt: order.txt ${SOURCES}
	@echo "Indexing the sections"
	@groovy findSections.groovy > sections.txt

toc.txt: makeToC.groovy order.txt ${SOURCES}
	@echo -n "Making the ToC ... "
	@for lang in $(LANGS) ; do \
		echo -n "$$lang " ; \
		groovy makeToC.groovy $$lang > toc.$$lang.txt ; \
	done
	@echo ""
	@touch toc.txt

docs/%.md : src/%.i.md createMarkdown.groovy references.dat
	@echo "Creating $@"
	@groovy createMarkdown.groovy $< > $@

