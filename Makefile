all: mooring_table.tex
	latexmk -pdf mooring_table

clean:
	-rm *.pdf *.aux *.log
