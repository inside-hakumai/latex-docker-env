SHELL := /bin/bash

ALL     : COMPILE CLEAN

COMPILE :
	pdflatex -output-directory out $(FILE) && \
	bibtex out/$(FILE) && \
	pdflatex -output-directory out $(FILE) && \
	pdflatex -output-directory out $(FILE)

CLEAN   :
	rm -vf out/$(FILE).aux 
	rm -vf out/$(FILE).lof 
	rm -vf out/$(FILE).log 
	rm -vf out/$(FILE).toc
	rm -vf out/$(FILE).out
	rm -vf out/$(FILE).bbl
	rm -vf out/$(FILE).blg
	rm -vf out/texput.log
