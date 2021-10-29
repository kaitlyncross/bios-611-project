# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Generate Figures

library(tidyverse)
#setwd("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT")
load("author.Rdata")

#histogram of the number of books published by year
png(filename="Figures/FirstBookOverTime.png")
ggplot(author, aes(first_book, na.rm=T)) + geom_histogram()
dev.off()
