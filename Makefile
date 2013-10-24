filename=hql_synopsis

bib:
	bibtex ${filename}
pdf: ps
	ps2pdf ${filename}.ps

ps: dvi
	dvips ${filename}.dvi

dvi:
	latex ${filename}
kate:
	kate *.tex

readpdf:
	kde-open ${filename}.pdf &

clean:
	rm -f ${filename}.ps ${filename}.pdf ${filename}.log ${filename}.aux ${filename}.out ${filename}.dvi ${filename}.bbl ${filename}.blg
