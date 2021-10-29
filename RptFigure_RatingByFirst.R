# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Generate Figures

library(tidyverse)
#setwd("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT")
load("author.Rdata")

#date of first book published
png(file="Figures/RatingByFirst.png")
ggplot(author, aes(x=first_book,y=avg_rating, na.rm=T)) + 
  geom_point() +
  labs(title="Average Author Rating by Date of First Book",
       x="Date of First Published Book",
       y="Author's Average Rating (0 to 5 stars)")
dev.off()
