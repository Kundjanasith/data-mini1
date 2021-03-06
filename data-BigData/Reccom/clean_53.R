library(data.table)
file <- read.csv('../Q53.csv')
file <- file[c('ID','Program','entry2553_GPAX')]
file$Program <- ifelse(file$Program=='วิศวกรรมเครื่องกล','Mechanical Engineering',ifelse(file$Program=='วิศวกรรมโยธา','Civil Engineering',ifelse(file$Program=='วิศวกรรมสิ่งแวดล้อม','Environmental Engineering',ifelse(file$Program=='วิศวกรรมไฟฟ้า','Electrical Engineering',ifelse(file$Program=='วิศวกรรมอุตสาหการ','Industrial Engineering',ifelse(file$Program=='วิศวกรรมเคมีและชีวภาพ','Chemical & Biological Engineering','No'))))))
#dataTable <- data.table(file)
#file <- dataTable[, mean(X2553_GPAX), by=c('entry2553_GPAX','Program')]
#file <- as.data.frame.matrix(file)
file <- unique(file)
file <- subset(file, Program!='No')
write.csv(file, file='clean_53_R.csv',row.names=FALSE)
print("Mechanical Engineering")
print(nrow(subset(file,Program=='Mechanical Engineering')))
print("Civil Engineering")
print(nrow(subset(file,Program=='Civil Engineering')))
print("Environmental Engineering")
print(nrow(subset(file,Program=='Environmental Engineering')))
print("Electrical Engineering")
print(nrow(subset(file,Program=='Electrical Engineering')))
print("Chemical & Biological Engineering")
print(nrow(subset(file,Program=='Chemical & Biological Engineering')))
