args <- commandArgs(TRUE)
print(args)
file <- read.csv('Q53.csv')
data <- subset(file, ID==args[1])
ungroupdata <- data[,c("EnrolledYear","Semester","GPA","X2553_GPAX","entry2553_GPAX")]
groupdata <- unique(ungroupdata)
names(groupdata)
groupdata[ order(unlist(groupdata['EnrolledYear']),unlist(groupdata['Semester'])), ]
