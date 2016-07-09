
plotEiei <- function(x){
        print("eiei")
        print(x['ID'])
}

file <- read.csv('Q57.csv')
res <- c()
for( x in unlist(unique(file['ID']))){
#print(x)
data <- subset(file, ID==x)
ungroupdata <- data[,c("ID","EnrolledYear","Semester","GPA","X2557_GPAX","entry2553_GPAX")]
groupdata <- unique(ungroupdata)
#names(groupdata)
groupdata <- groupdata[ order(unlist(groupdata['EnrolledYear']),unlist(groupdata['Semester'])), ]

#print(groupdata)
#write.csv(groupdata, file="fff.csv", append=TRUE)
#print(nrow(groupdata))
#n <- nrow(groupdata)
res <- rbind(res, groupdata)
}
print(res)
#print(mode(unlist(groupdata)))
write.csv(res, file="Q57_BYR.csv")
