CODEFILES: \
 $(shell groovy ../findScripts.groovy ../src .out)

.PRECIOUS: %.groovy %.ipynb

all: allScriptsCompiled scriptCount.tex

distclean: clean
	@rm -f *.md *.out *.bsh *.java *.groovy *.ipynb

clean:
	@rm -f *~ *.class allScriptsCompiled

allScriptsCompiled: ${CODEFILES}
	@touch allScriptsCompiled

%.ipynb : %.py
	@echo "creating an Python notebook for $@ ..."
	@python3 py2ipynb.py $< $@

%.py : %.pyin source.*.template
	@echo "Processing " $<
	@groovy preprocess $<

%.out: %.py %.ipynb md.*.template
	@echo "doing $@ ..."
	@python3 $< 2> /dev/null | groovy ../wrap.groovy > $@
	@if [ -e *.png ]; then mogrify -trim *.png ; fi
	@if [ -e *.png ]; then mv *.png ../images/generated/. ; fi
	@groovy postprocess $<
