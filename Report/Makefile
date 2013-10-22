targets=report.pdf
deps=$(wildcard */*.tex) $(wildcard images/*.png) $(wildcard images/*.jpg) $(wildcard images/*.jpeg) $(wildcard images/*.pdf) $(wildcard bibliography/*.bib)

%.pdf: %.tex $(deps) Makefile build
	cd build && TEXINPUTS=../:../packages:${TEXINPUTS} pdflatex $<
	cd build && BIBINPUTS=..:${BIBINPUTS} bibtex $*
	cd build && TEXINPUTS=../:../packages:${TEXINPUTS} pdflatex $<
	cd build && TEXINPUTS=../:../packages:${TEXINPUTS} pdflatex $<
	mv build/$@ .

all:	$(targets)

clean: buildclean

build:
	mkdir -p build

buildclean:
	rm -rf build *~ */*~ 

distclean: clean
	rm -f $(targets)

installdeb:
	sudo apt-get install texlive texlive-math-extra

.PHONY: clean buildclean distclean all dist installdeb
