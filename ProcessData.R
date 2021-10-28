# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Data pre-processing

library(tidyverse)

setwd("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT")
init = read.csv("books.csv")

#separate authors column into individual authors
init2 <- init %>% separate(col=authors, 
                   into=c("author1","author2","author3","author4","author5",
                          "author6","author7","author8","author9","author10",
                          "author11","author12","author13","author14","author15",
                          "author16","author17","author18","author19","author20",
                          "author21","author22","author23","author24","author25",
                          "author26","author27","author28","author29","author30",
                          "author31","author32","author33","author34","author35",
                          "author36","author37","author38","author39","author40",
                          "author41","author42","author43","author44","author45",
                          "author46","author47","author48","author49","author50",
                          "author51","author52","author53"),
                   sep="/",
                   extra="warn")

init3 <- init2 %>% tidyr::pivot_longer(cols = starts_with("author"),
                                       names_to = "author_no",
                                       values_to = "author",
                                       names_prefix = "author", values_drop_na=T)
#adds 8114 rows of duplicate title/ISBN/etc

# Find number of books per author
author1 <- init3 %>% count(author, sort=T)
# Find average rating per author
init3$average_rating = as.numeric(as.character(init3$average_rating))
author2 <- init3 %>% group_by(author) %>% summarize(avg_rating = mean(average_rating))
# Find min publication date
author3 <- init3 %>% group_by(author) %>% summarize(first_book = min(publication_date))
# Find max publication date
author4 <- init3 %>% group_by(author) %>% summarize(last_book = max(publication_date))
# Find most common publisher
# [Return to this later]
#author5a <- init3 %>% group_by(author, publisher) %>% summarize(count = count(publisher))

author <- merge(author1,author2,by="author")
author <- merge(author,author3,by="author")
author <- merge(author,author4,by="author")

#Save dataset author in working directory
write.csv(author, file="author.csv")
