file <- read.csv('Q54_BYR.csv')
output <- subset(file, EnrolledYear==2555)
print(output)
nrow(output)
write.csv(output, file = 'Q54-to-CSV-2555.csv')


