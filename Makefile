.SUFFIXES: .tex .bib .aux .bbl .dvi .ps .pdf .thy

dist-sys-notes.pdf:	dist-sys-slides.pdf dist-sys-handout.pdf dist-sys-notes.bbl
	pdflatex dist-sys-notes

%.pdf: %.aux
	pdflatex $(@:.pdf=)

%.bbl:	references.bib %.aux
	bibtex $(@:.bbl=)

%.aux:	*.tex
	pdflatex $(@:.aux=)

clean:
	rm -f dist-sys-{slides,handout,notes}.{log,aux,out,bbl,blg,dvi,ps,pdf}
