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
 Figures/*
	pdflatex report.tex
# insert report dependencies as they are created

#process data for figures
author.Rdata: ProcessData.R
	Rscript ProcessData.R
#process data for figures
books.Rdata: ProcessData.R
	Rscript ProcessData.R

#Figure 1: Book Authorship Over Time
Figures/FirstBookOverTime.png: ProcessData.R author.Rdata RptFigure_FirstBookOverTime.R
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
	
#Figure 4: Data Over Time
Figures/FiguresOverTime.png:\
 ProcessData.R\
 books.Rdata\
 RptFigure_GraphsOverTime.R 
	Rscript RptFigure_GraphsOverTime.R
	
#Figure 5: Ratings by Book
Figures/ratingsfigure.png:\
 ProcessData.R\
 books.Rdata\
 RptFigure_RatingsFigure.R 
	Rscript RptFigure_RatingsFigure.R
	
#Figure 5: Ratings vs Reviews
Figures/ratingvreview.png:\
 ProcessData.R\
 books.Rdata\
 RptFigure_RatingsvReviews.R 
	Rscript RptFigure_RatingsvReviews.R