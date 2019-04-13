LATEX=xelatex
BIBER=biber
DOC=master-thesis
PRES=presentation
GARBAGE=aux,log,bbl,bcf,blg,run.xml,toc,tct,out,snm,nav

.PHONY: all clean install

all: $(DOC).pdf $(PRES).pdf

clean:
	rm -f $(PRES).{$(GARBAGE),pdf}
	rm -f $(DOC).{$(GARBAGE),pdf}

# nix-build needs it
install:

$(DOC).pdf: $(DOC).tex $(DOC).bib
	$(LATEX) $(DOC)
	$(BIBER) $(DOC)
	$(LATEX) $(DOC)
	$(LATEX) $(DOC)
	rm -f $(DOC).{$(GARBAGE)}

$(PRES).pdf: $(PRES).tex $(DOC).bib
	$(LATEX) $(PRES)
	$(BIBER) $(PRES)
	$(LATEX) $(PRES)
	$(LATEX) $(PRES)
	rm -f $(PRES).{$(GARBAGE)}
