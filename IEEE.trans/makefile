cmd = pdflatex
ieee.pdf : ieee.tex *.tex makefile
	$(cmd) ieee
	bibtex ieee
	bibtex ieee
	$(cmd) ieee
	$(cmd) ieee
#	dvipdf ieee

clean:
	rm -fv *.log *.thm *.blg *.aux *.out *.dvi
