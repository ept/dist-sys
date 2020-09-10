.SUFFIXES: .tex .bib .aux .bbl .dvi .ps .pdf .thy

solutions.pdf: dist-sys-notes.pdf
	pdflatex -shell-escape solutions

dist-sys-notes.pdf:	dist-sys-slides.pdf dist-sys-handout.pdf dist-sys-notes.bbl
	pdflatex -shell-escape dist-sys-notes

%.pdf: %.aux
	pdflatex -shell-escape $(@:.pdf=)

%.bbl:	references.bib %.aux
	bibtex $(@:.bbl=)

%.aux:	*.tex
	pdflatex -shell-escape $(@:.aux=)

clean:
	rm -f dist-sys-{slides,handout,notes}.{log,aux,out,bbl,blg,dvi,ps,pdf}
