publish:
	pdflatex --shell-escape main.tex
	mv main.pdf Calculus_Notes.pdf

clean:
	rm main.aux main.dvi main.fdb_latexmk main.fls main.log main.out main.synctex.gz

.PHONY: publish clean
