#cmd = pdflatex
cmd = xelatex -synctex=1 -shell-escape
ieee.pdf : ieee.tex *.tex *.sty makefile
	$(cmd) ieee
	bibtex ieee
	bibtex ieee
	$(cmd) ieee
	$(cmd) ieee
#	dvipdf ieee

clean:
	rm -fv *.log *.thm *.blg *.aux *.out *.dvi
