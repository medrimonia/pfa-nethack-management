document-de-specifications.pdf : document-de-specifications.dvi diagrammes/planning.pdf
	dvipdf document-de-specifications.dvi tmp.pdf
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite   \
	-sOutputFile=document-de-specifications.pdf  \
	tmp.pdf diagrammes/planning.pdf

document-de-specifications.dvi : document-de-specifications.tex
	latex document-de-specifications.tex

clean:
	rm -rf *.log *.aux *.dvi *~
