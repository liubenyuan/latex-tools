cmd = pdflatex
ieee : ieee.tex *.tex makefile
	$(cmd) ieee
	bibtex ieee
	bibtex ieee
	$(cmd) ieee
	$(cmd) ieee

ieee-brief : ieee-brief.tex *.tex makefile
	$(cmd) ieee-brief
	bibtex ieee-brief
	bibtex ieee-brief
	$(cmd) ieee-brief
	$(cmd) ieee-brief

clean:
	rm -fv *.log *.thm *.blg *.aux *.out *.dvi
