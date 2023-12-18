.PHONY: interactive 

%.pdf: %.tex slides.md
	latexmk -pdf -xelatex -f $^

%.tex: %.md
	pandoc --citeproc --biblatex -o $@ -t beamer $^

%.html: %.md
	pandoc -o $@ -s --citeproc --bibliography globals/papers.bib --css globals/pandoc.css $^

interactive:
	fswatch -0 slides.md | xargs -0 -I {} sh -c "pandoc -o slides.html -s --bibliography globals/papers.bib --css globals/pandoc.css {} && echo reload" | websocat -s 56789


