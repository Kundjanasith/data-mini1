file <- read.csv('Q56_BYR.csv')
output <- subset(file, EnrolledYear==2556)
print(output)
nrow(output)
write.csv(output, file = 'Q56-to-CSV-2556.csv')


