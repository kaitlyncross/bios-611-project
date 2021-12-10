# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Generate Figures

library(tidyverse)
library(ggstatsplot)
#setwd("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT")
load("books.Rdata")

books$avg_rating <- as.numeric(books$average_rating)
books$num_pages <- as.numeric(books$num_pages)
#histogram of distribution of plot
hist <- ggplot(books) + geom_histogram(aes(x = avg_rating))
# scatter 1: Number of ratings
sc1 <- ggplot(books, aes(x=ratings_count,y=avg_rating, na.rm=T)) + 
  geom_point() +
  labs(title="Average Book Rating by Number of Book Ratings",
       x="Number of Book Ratings (count)",
       y="Average Rating")
# scatter 2: Length of book
sc2 <- ggplot(books, aes(x=num_pages,y=avg_rating, na.rm=T)) + 
  geom_point() + scale_x_continuous(trans='log2') +
  stat_smooth(method=lm) +
  labs(title="Average Book Rating by Length of Book",
       x="Length of Book (Log(Pages)",
       y="Average Rating")

png(filename="Figures/ratingsfigure.png")
ggarrange(hist, sc1, sc2, 
          labels = c("A", "B", "C"),
          ncol = 2, nrow = 2)
dev.off()