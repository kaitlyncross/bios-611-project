# Kaitlyn Cross
# BIOS 611 Final Project
# Program Purpose: Data pre-processing

library(tidyverse)
library(stringr)

#init = read.csv("C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT/books.csv")
init = read.csv("books.csv")

#add number of authors per book
nauth_perbook <- init %>% mutate(nauthor = str_count(authors, '/')+1) %>% select(isbn,nauthor)
init1 <- left_join(init, nauth_perbook, by=c("isbn"))
#separate authors column into individual authors
init2 <- init1 %>% separate(col=authors, 
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
author3 <- init3 %>% group_by(author) %>% summarize(first_book = as.Date(min(publication_date),format="%m/%d/%Y"))
# Find max publication date
author4 <- init3 %>% group_by(author) %>% summarize(last_book = as.Date(max(publication_date),format="%m/%d/%Y"))

author <- merge(author1,author2,by="author")
author <- merge(author,author3,by="author")
author <- merge(author,author4,by="author")

## Examine data by publisher/author combo
# Find all publisher/author combinations
init3$publisher.f <- as.factor(init3$publisher)
pub1 <- init3 %>% group_by(author, publisher.f) %>% tally()
# Find book within those combinations with maximum rating
pub2 <- init3 %>% group_by(author,publisher.f) %>%
                  filter(average_rating == max(average_rating)) %>%
                  select(author, publisher.f, average_rating, title)
# Find earliest and latest date of publication by author/publisher
pub3 <- init3 %>% group_by(author,publisher.f) %>%
                  filter(publication_date == max(publication_date)) %>%
                  select(author, publisher.f, publisher, publication_date)
pub3 <- rename(pub3, lastpub = publication_date)
pub4 <- init3 %>% group_by(author,publisher.f) %>%
                  filter(publication_date == min(publication_date)) %>%
                  select(author, publisher.f, publisher, publication_date)
pub4 <- rename(pub4, firstpub = publication_date)

publisher <- merge(pub1,pub2,by=c("author","publisher.f"))
publisher <- merge(publisher,pub3,by=c("author","publisher.f"))
publisher <- merge(publisher,pub4,by=c("author","publisher.f"))

#Save dataset author in working directory
save(author, file="author.Rdata")
#save(publisher, file="publisher.Rdata")
#save(init1, file="books.Rdata")
saveRDS(init1, file = "books.Rdata")
