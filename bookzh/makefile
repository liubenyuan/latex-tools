CMD = xelatex -shell-escape -synctex=1
pdf: main.tex tex/*.tex
	$(CMD) main
	bibtex main
	bibtex main
	$(CMD) main
	$(CMD) main
clean:
	rm -v *.aux *.log *.toc *.out *.bbl *.thm *.blg *.lot *.lof
