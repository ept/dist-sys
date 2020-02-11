.SUFFIXES: .tex .bib .aux .bbl .dvi .ps .pdf .thy

all:	slides.pdf dist-sys.pdf

slides.pdf:
	pdflatex slides

%.pdf:	%.bbl
	pdflatex $(@:.pdf=)
	pdflatex $(@:.pdf=)

%.bbl:	references.bib %.aux
	bibtex $(@:.bbl=)

%.aux:	*.tex
	pdflatex $(@:.aux=)

clean:
	rm -f dist-sys.{log,aux,out,bbl,blg,dvi,ps,pdf}
