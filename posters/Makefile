POSTER = design_sprint_poster.tex
BASENAME = $(basename $(POSTER))
FILES = chamada.tex contato.tex design_sprint_poster.tex \
		evento.tex material_design.tex
LATEX = xelatex

design_sprint_poster.pdf: ${POSTER} ${FILES}
	${LATEX} ${POSTER}

clean:
	@rm -f ${BASENAME}.log ${BASENAME}.aux ${BASENAME}.pdf
