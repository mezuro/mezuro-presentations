pdf:
	pdflatex $(filter-out $@, $(MAKECMDGOALS))

clean:
	rm *.out *.nav *.aux *.snm *.toc *.log
