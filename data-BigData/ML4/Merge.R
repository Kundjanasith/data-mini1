file53 <- read.csv('clean_53.csv')
file54 <- read.csv('clean_54.csv')
file55 <- read.csv('clean_55.csv')
file56 <- read.csv('clean_56.csv')
file57 <- read.csv('clean_57.csv')
res1 <- rbind(file53,file54)
res2 <- rbind(file55,file56)
res3 <- rbind(res1,res2)
res4 <- rbind(res3,file57)
write.csv(res4,file='source_ml4.csv',row.names=FALSE)
