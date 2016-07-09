file <- read.csv('Q57_BYR.csv')
output <- subset(file, EnrolledYear==2557)
print(output)
nrow(output)
write.csv(output, file = 'Q57-to-CSV-2557.csv')


