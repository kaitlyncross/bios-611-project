# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Generate Figures

library(tidyverse)
#setwd("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT")
load("author.Rdata")

#Create a figure showing average author rating by
#avg rating by # of books published
png(file="Figures/RatingByN.png")
ggplot(author, aes(x=n,y=avg_rating, na.rm=T)) + 
    geom_point() +
    labs(title="Average Author Rating by Number of Books Published",
         x="Number of Books Published (count)",
         y="Author's Average Rating (0 to 5 stars)")
dev.off()
