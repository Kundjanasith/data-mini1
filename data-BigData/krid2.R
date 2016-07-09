#ratings <- read.delim('~/Downloads/ml-100k/u.data', sep='\t', header=FALSE)
#users <- read.delim('~/Downloads/ml-100k/u.user', sep='|', header=FALSE)
#movies <- read.delim('~/Downloads/ml-100k/u.item', sep='|', header=FALSE)

#install.packages("twitteR")
#install.packages("ROAuth")
#install.packages("plyr")
#install.packages("stringr")
#install.packages("ggplot2")

library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(ggplot2)

download.file(url="https://curl.haxx.se/ca/cacert.pem", destfile ="cacert.pem")

#reqURL <- 'https://api.twitter.com/oauth/request_token'
#accessURL <- 'https://api.twitter.com/oauth/access_token'
#authURL <- 'https://api.twitter.com/oauth/authorize'
#consumerKey <- 'DiEWrBB8uRYEcz6uhu3PjUYDT' #put the Consumer Key from Twitter Application
#consumerSecret <- 'IoPA9hDXSSD6xu2YKo0I4zYrz2frByMtcu7cFGG3iPkGeajTE2'  #put the Consumer Secret from Twitter Application
#Cred <- OAuthFactory$new(consumerKey=consumerKey,
#consumerSecret=consumerSecret,
#requestURL=reqURL,
#accessURL=accessURL,
#authURL=authURL)
#Cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl'))

#6561979

api_key = 'DiEWrBB8uRYEcz6uhu3PjUYDT'
api_secret = 'IoPA9hDXSSD6xu2YKo0I4zYrz2frByMtcu7cFGG3iPkGeajTE2'
access_token = '742900921508630528-jo9OgR1uql9KXuA0bQHR1PUEkNgTc7v'
access_token_secret = '36A6n7bG5Y18k6OPyQcfVOfgoTF4FIuJcre2zBrCrgdaJ'
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret) 

some_tweets <- searchTwitter("#starbucks", n=100, lang="en")
tweetdf <- twListToDF(some_tweets)
write.csv(tweetdf, '~/Desktop/tweetdf.csv')


#sentiment analysis
#thailand <- searchTwitter("thailand", n=1000, lang="en")
#thailand2 <- twListToDF(thailand)

#sentiment function
library(plyr)
library(stringr)
score.sentiment = function(sentences, pos.words, neg.words, .progress='none'){
  require(plyr)
  require(stringr)
  scores = laply(sentences, function(sentences, pos.words, neg.words){
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    sentence = tolower(sentence)
    word.list = str_split(sentence, '\\s+')
    words = ublist(word.list)
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    score = sum(pos.matches) - sum(neg.matches)
    return(score)
  }, pos.words, neg.words, .progress=.progress)
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}



