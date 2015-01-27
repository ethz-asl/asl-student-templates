# The target that we want to build, TODO: change name if required
targets=report.pdf

# Dependencies, all files which are taken into consideration when make decides
# if rebuilding is necessary
deps=$(wildcard */*.tex) $(wildcard images/*.png) $(wildcard images/*.jpg) \
	$(wildcard images/*.jpeg) $(wildcard images/*.pdf) \
	$(wildcard bibliography/*.bib)

# NOTE: you should note change anything below
%.pdf: %.tex $(deps) Makefile build
	# cd to build and build the report
	cd build && TEXINPUTS=../:../packages:${TEXINPUTS} pdflatex $<
	cd build && BIBINPUTS=../:${BIBINPUTS} BSTINPUTS=../:${BSTINPUTS} bibtex $*
	cd build && TEXINPUTS=../:../packages:${TEXINPUTS} pdflatex $<
	cd build && TEXINPUTS=../:../packages:${TEXINPUTS} pdflatex $<
	# copy the resulting pdf back to the main directory (mv is no good, because
	# make will rebuild even if nothing has changed)
	cp build/$@ .

all: $(targets)

clean: buildclean

build:
	# make sure that build exists
	mkdir -p build

buildclean:
	# remove the build folder
	rm -rf build *~ */*~ 

distclean: clean
	# remove the build folder (clean) and the target pdf
	rm -f $(targets)

installdeb:
	# required packages to use this makefile
	sudo apt-get install texlive texlive-math-extra

.PHONY: clean buildclean distclean all dist installdeb
