# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Generate Figures

library(tidyverse)
library(ggstatsplot)
#setwd("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT")
load("books.Rdata")

#histogram of the number of books published by year
png(filename="Figures/ratingvreview.png")
ggstatsplot::ggscatterstats(data = books, x = ratings_count, y = text_reviews_count)
dev.off()