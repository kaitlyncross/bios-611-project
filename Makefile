.PHONY: clean
.PHONY: shiny_app
SHELL: /bin/bash

#Remove dataset, figures, reports generated
clean:
	rm -f Figures/*.png
	rm -f author.Rdata
	rm -f report.pdf
	
#Final report output ##############
report.pdf:\
 report.tex\
 Figures/FirstBookOverTime.png\
 Figures/RatingByFirst.png\
 Figures/RatingByN.png
	pdflatex report.tex
# insert report dependencies as they are created

#process data for figures
author.Rdata: ProcessData.R
	Rscript ProcessData.R

#Figure 1: Book Authorship Over Time
Figures/FirstBookOverTime.png: ProcessData.R author.Rdata RptFigure_FirstBookOverTime.r
	Rscript RptFigure_FirstBookOverTime.R

#Figure 2: Avg Author Rating by time of first publication
Figures/RatingByFirst.png: ProcessData.R author.Rdata RptFigure_RatingByFirst.R
	Rscript RptFigure_RatingByFirst.R

#Figure 3: Average author rating by # of books published
Figures/RatingByN.png:\
 ProcessData.R\
 author.Rdata\
 RptFigure_RatingByN.R 
	Rscript RptFigure_RatingByN.R