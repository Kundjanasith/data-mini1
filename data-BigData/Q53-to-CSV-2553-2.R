file <- read.csv('Q53-to-CSV-2553.csv')
output <- subset(file, Semester==2)
print(output)
nrow(output)
write.csv(output, file = 'Q53-to-CSV-2553-2.csv')
