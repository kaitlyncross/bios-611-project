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
 Figures/RatingByN.png\
	pdflatex report.tex
# insert report dependencies as they are created

#process data for figures
author.Rdata: ProcessData.r
	Rscript ProcessData.r

#Figure 1: Book Authorship Over Time
Figures/FirstBookOverTime.png: ProcessData.r author.Rdata RptFigure_FirstBookOverTime.r
	Rscript RptFigure_FirstBookOverTime.r

#Figure 2: Avg Author Rating by time of first publication
Figures/RatingByFirst.png: ProcessData.r author.Rdata RptFigure_RatingByFirst.r
	Rscript RptFigure_RatingByFirst.r 

#Figure 3: Average author rating by # of books published
Figures/RatingByN.png:\
 ProcessData.r\
 author.Rdata\
 RptFigure_RatingByN.r 
	Rscript RptFigure_RatingByN.r 