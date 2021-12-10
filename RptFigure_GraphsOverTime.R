# Relationships over time

test <- books %>% mutate(pubdt = as.Date(publication_date,format="%m/%d/%Y"))

png(filename="C:/Users/kaitl/Dropbox/School/BIOS 611 Intro to Data Science/PROJECT/Figures/FiguresOverTime.png")
par(mfrow=c(2,2))
plot(test$pubdt,test$nauthor,main="Number of Authors over Time",
     xlab="Publication Date", ylab="Number of Authors Listed")
abline(lm(test$nauthor ~ test$pubdt))

plot(test$pubdt,test$average_rating,main="Average Rating over Time",
     xlab="Publication Date", ylab="Average Rating")
abline(lm(test$average_rating ~ test$pubdt))

plot(test$pubdt,test$num_pages,main="Book Length over Time",
     xlab="Publication Date", ylab="Number of Pages")
abline(lm(test$num_pages ~ test$pubdt))

plot(test$pubdt,test$ratings_count,main="Number of Ratings over Time",
     xlab="Publication Date", ylab="Number of Ratings")
abline(lm(test$ratings_count ~ test$pubdt))

dev.off()
