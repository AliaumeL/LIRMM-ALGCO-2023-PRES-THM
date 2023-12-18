---
lang: en-GB
---

# beamer-template

A simple beamer template to simplify writing conference presentations.

## How To Use

Create a new project using this repository as a template. Then, rename the file
`beamer.tex` into the name of your talk. Update the file `globals/metadata.tex`
to match the description of your talk. Finally, write the content of your
slides in the `beamer.tex` file. To compile, use `make name_of_your_talk.pdf`.

If you wish to use [markdown] instead of plain [latex], you can write your
slides in the file `slides.md`. It is possible to preview in a lightweight
fashion the contents of the slides using `make slides.html`, and enable live
previewing (with hot reloading of the html) using `make interactive`.

[markdown]: https://en.wikipedia.org/wiki/Markdown
[latex]: https://en.wikipedia.org/wiki/LaTeX

## Hard Dependencies

- [latemk](https://ctan.org/pkg/latexmk?lang=en)
- [beamer theme metropolis](https://ctan.org/pkg/beamertheme-metropolis)
- Fonts: Roboto, Andika New Basic, Ubuntu Mono

## Soft Dependencies

- [make](https://en.wikipedia.org/wiki/Make)
- [pandoc](https://pandoc.org) 
- [inkscape](https://inkscape.org)
- [fswatch](https://emcrisostomo.github.io/fswatch/)
- [websocat](https://github.com/vi/websocat)
