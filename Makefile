.PHONY: interactive 

%.pdf: %.tex slides.tex
	latexmk -pdf -xelatex -f $^

%.tex: %.md
	pandoc --citeproc --slide-level=3 --bibliography globals/papers.bib --biblatex -o $@ -t beamer $^

%.html: %.md
	pandoc -o $@ -s --mathjax --citeproc --bibliography globals/papers.bib --css globals/pandoc.css $^

interactive:
	fswatch -0 slides.md | xargs -0 -I {} sh -c "pandoc --mathjax --citeproc -o slides.html -s --bibliography globals/papers.bib --css globals/pandoc.css {} && echo reload" | websocat -s 56789


