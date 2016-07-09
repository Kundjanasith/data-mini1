args <- commandArgs(TRUE)
path <- args[1]
file <- read.csv(path)
file <- file[c('entry2553_GPAX','Thai','PhysicalAct','Math','Art','Science','Industrial','Social','English','Province')]
outputPath <- args[2]
print(file)
write.csv(file,file=outputPath,row.names=FALSE)
