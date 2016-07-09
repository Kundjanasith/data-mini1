file <- read.csv('Q55_BYR.csv')
output <- subset(file, EnrolledYear==2557)
print(output)
nrow(output)
write.csv(output, file = 'Q55-to-CSV-2557.csv')


