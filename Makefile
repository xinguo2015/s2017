# make -f Makefile

PAPER = lfc
BIB = rendering
FIG = images/samplefigure.eps
STY = *.cls

pdf: $(PAPER).pdf

$(BIB).bbl: $(BIB).bib
	latex $(PAPER)
	bibtex $(PAPER)
	latex $(PAPER)

$(PAPER).ps: $(PAPER).tex $(STY) $(FIG) $(BIB).bbl
	latex $(PAPER)
	dvips -Ppdf -G0 -t letter $(PAPER)

$(PAPER).pdf: $(PAPER).ps
	ps2pdf -dPDFSETTINGS=/prepress \
	-dCompatibilityLevel=1.4 \
	-dAutoFilterColorImages=false \
	-dAutoFilterGrayImages=false \
	-dColorImageFilter=/FlateEncode \
	-dGrayImageFilter=/FlateEncode \
	-dMonoImageFilter=/FlateEncode \
	-dDownsampleColorImages=false \
	-dDownsampleGrayImages=false $(PAPER).ps $(PAPER).pdf

clean:
	rm -f $(PAPER).log $(PAPER).aux $(PAPER).blg $(PAPER).out
	rm -f $(PAPER).bbl $(PAPER).dvi $(PAPER).ps 

cleanall: clean
	rm -f $(PAPER).pdf

