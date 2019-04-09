LATEX=xelatex
BIBER=biber
DOC=master-thesis

.PHONY: all clean install

all: $(DOC).pdf

clean:
	rm -f $(DOC).{bib,aux,log,bbl,bcf,blg,run,xml,toc,tct,pdf,out}

# nix-build needs it
install:

$(DOC).pdf:
	$(LATEX) $(DOC)
	$(BIBER) $(DOC)
	$(LATEX) $(DOC)
	$(LATEX) $(DOC)
	rm -f $(DOC).{bib,aux,log,bbl,bcf,blg,run,xml,toc,tct,out}
