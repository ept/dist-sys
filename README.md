Distributed Systems Course
==========================

This repository contains the LaTeX source of my slides, lecture notes, and exercises for the
[Distributed Systems](https://www.cl.cam.ac.uk/teaching/2122/ConcDisSys/) course I teach at the
[University of Cambridge](https://www.cst.cam.ac.uk/). It's the second half of a course on
Concurrent and Distributed Systems, but this repository only contains the distributed half.

The material is published under a
[Creative Commons BY-SA license](https://creativecommons.org/licenses/by-sa/4.0/).
Informally speaking, this means you can use it freely as long as you give me credit for the
original, and when you base your own work on it, you distribute your derivative work under the
same license as the original.

Building the PDF files requires a [LaTeX distribution](https://www.latex-project.org/get/) and
[Pygments](https://pygments.org/) for syntax highlighting.
`pdflatex` must be run with option `-shell-escape` so that it can run `pygmentize`.
Figures are drawn in the LaTeX source using [TikZ](https://pgf-tikz.github.io/pgf/pgfmanual.pdf).

Guide to the source files:

* `Makefile` builds everything; just type `make`.
* `dist-sys.tex` contains all the actual content.
* `dist-sys-slides.tex` is the entry point for the slides, formatted for on-screen display.
* `dist-sys-handout.tex` is the entry point for the slides in printer-friendly formatting.
* `dist-sys-notes.tex` is the entry point for the lecture notes, consisting of prose with
  embedded slides. Requires `dist-sys-handout.pdf` to be built first.
* `solutions.tex` is the entry point for the solution notes for exercises. The content is
  written to `exercises.tex` when you build `dist-sys-notes.pdf`.

Copyright 2020-2021 Martin Kleppmann


Translations
------------

* Chinese translation by Weiran Liu (刘巍然): 
  [videos on Bilibili](https://space.bilibili.com/5277360/channel/collectiondetail?sid=1194136),
  [subtitles](https://github.com/liuweiran900217/doss/tree/main/Distributed%20System%20-%20Martin%20Kleppmann)
