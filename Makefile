LATEX=xelatex
BIBER=biber
PDFTK=pdftk
CONVERT=convert
DOC=master-thesis
DOC_ANTIPLAG=thesis-mukhutdinov
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

title-page.pdf: $(DOC).pdf
	$(PDFTK) $(DOC).pdf cat 1-2 output title-page.pdf

specification.pdf: $(DOC).pdf
	$(PDFTK) $(DOC).pdf cat 3-4 output specification.pdf

annotation.pdf: $(DOC).pdf
	$(PDFTK) $(DOC).pdf cat 5-6 output annotation.pdf

thesis.pdf: $(DOC).pdf
	$(PDFTK) $(DOC).pdf cat 7-end output thesis.pdf

$(DOC_ANTIPLAG).pdf: title-page.pdf specification.pdf annotation.pdf thesis.pdf
	$(PDFTK) title-page.pdf specification.pdf annotation.pdf output header.pdf
	$(CONVERT) -density 600 +antialias header.pdf header-img.pdf
	rm header.pdf
	$(PDFTK) header-img.pdf thesis.pdf output $(DOC_ANTIPLAG).pdf
	rm header-img.pdf

$(PRES).pdf: $(PRES).tex $(DOC).bib
	$(LATEX) $(PRES)
	$(BIBER) $(PRES)
	$(LATEX) $(PRES)
	$(LATEX) $(PRES)
	rm -f $(PRES).{$(GARBAGE)}
