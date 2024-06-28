L10N :=
LANGS ?= en ${L10N}

SOURCES := src/atomsbonds.i.md src/index.i.md src/io.i.md src/migration.i.md src/ctr.i.md
TARGETS := docs/atomsbonds.md docs/index.md docs/io.md docs/migration.md docs/ctr.md
METAS := references.dat toc.txt indexList.i.md sections.txt

all: ${TARGETS} ${METAS} docs/index.md classinfo.tsv
	@cp code/*.ipynb docs/nb/.
	@cp code/*.code.md docs/code/.
	@cp indexList.en.md docs/indexList.md

clean:
	@rm -f ${TARGETS}

references.qids: findCitations.groovy ${SOURCES}
	@echo "Finding the citations"
	@groovy findCitations.groovy src | grep "^Q" | sort | uniq > references.qids

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

classinfo.tsv: classes.lst updateClassInfo.groovy
	@echo "Updating the class info TSV..."
	@groovy updateClassInfo.groovy  src > classinfo.tsv.new
	@mv classinfo.tsv.new classinfo.tsv

classes.lst: ${SOURCES} findClasses.groovy foo.sh
	@groovy findClasses.groovy src | sort | uniq > classes.lst
	@bash foo.sh  | sed -r 's/..\/cdk\/[^\/]*\/([^\/]*)\/src\/main\/java\/(.*)\/(.*)\.java/\3\t\2\t\1/' | grep "org/openscience" | grep -v "\.\./cdk" | sed 's/\//\./g' > classes.lst2
	@mv classes.lst2 classes.lst

indexList.i.md: topics.tsv makeIndex.groovy
	@echo -n "Making the index ... "
	@for lang in $(LANGS) ; do \
		echo -n "$$lang " ; \
		groovy makeIndex.groovy $$lang > indexList.$$lang.md ; \
	done
	@echo ""
	@touch indexList.i.md

topics.tsv: ${SOURCES} findTopics.groovy
	@echo -n "Extracting the topics ... "
	@for lang in $(LANGS) ; do \
		echo -n "$$lang " ; \
		groovy findTopics.groovy src $$lang | sort > topics.$$lang.tsv ; \
	done
	@echo ""
	@touch topics.tsv

docs/%.md : src/%.i.md createMarkdown.groovy references.dat
	@echo "Creating $@"
	@groovy createMarkdown.groovy $< > $@

