clean :
	find . -name "*~" -exec rm {} \;
	find . -name "*.html" -exec rm {} \;
	find . -name "*.tex" -exec rm {} \;
	find . -name "*.pdf" -exec rm {} \;

.PHONY : clean
