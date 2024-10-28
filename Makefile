SHELL=/bin/bash
LATEX=pdflatex -shell-escape -halt-on-error -file-line-error

.SUFFIXES: .tex .bib .aux .bbl .dvi .ps .pdf .thy
.PRECIOUS: %.aux

all:	dist-sys-notes.pdf dist-sys-slides.pdf solutions.pdf examples1.pdf

%.pdf: %.tex %.aux
	$(LATEX) $<
	while grep 'Rerun to get ' $*.log; do $(LATEX) $<; done

%.aux:	%.tex
	$(LATEX) $<

%.bbl:	references.bib %.aux
	bibtex $*

solutions.pdf: dist-sys-notes.pdf

dist-sys-notes.pdf:	dist-sys-handout.pdf dist-sys-notes.bbl

clean:
	rm -f {dist-sys-{slides,handout,notes},solutions,examples1}.{log,aux,out,bbl,blg,nav,snm,toc,dvi,ps,pdf}
