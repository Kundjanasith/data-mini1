file <- read.csv('Q53-to-CSV-2556.csv')
output <- subset(file, Semester==1)
print(output)
nrow(output)
write.csv(output, file = 'Q53-to-CSV-2556-1.csv')
