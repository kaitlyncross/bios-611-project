# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Generate Figures

library(tidyverse)
library(ggstatsplot)
#setwd("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT")
books <- readRDS("books.Rdata")

books$log_ratings_count <- log(books$ratings_count)
books$log_text_rev <- log(books$text_reviews_count)

#histogram of the number of books published by year
png(filename="Figures/ratingvreview.png")
ggstatsplot::ggscatterstats(data = books, x = log_ratings_count, y = log_text_rev, na.rm=T)
dev.off()
