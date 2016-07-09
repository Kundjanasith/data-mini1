file <- read.csv('Q56_BYR.csv')
output <- subset(file, EnrolledYear==2557)
print(output)
nrow(output)
write.csv(output, file = 'Q56-to-CSV-2557.csv')


