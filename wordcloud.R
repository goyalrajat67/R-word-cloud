
library("tm")
library("NLP")
library("wordcloud")
library("RColorBrewer")
speech ="PATH OF FILE"
wc_txt=readLines(speech)
wc <- Corpus(VectorSource(wc_txt))
wc <- tm_map(wc,stripWhitespace)
wc <- tm_map(wc,tolower)
wc <- tm_map(wc,PlainTextDocument)
wc <- tm_map(wc,removeNumbers)
wc <- tm_map(wc,removePunctuation)
wc <- tm_map(wc,removeWords,stopwords("english"))
summary(wc)
tdm_wc <- TermDocumentMatrix(wc)
tdm1 <- as.matrix(tdm_wc)
v = sort(rowSums(tdm1),decreasing = TRUE)

summary(v)

wordcloud(wc,scale=c(5,0.5), max.words=1000, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8,"Dark2"))
