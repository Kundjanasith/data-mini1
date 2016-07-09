
file = read.csv('Q57.csv')
print(nrow(unique(file['ID'])))
programs <- unique(file['Program'])
for( p in unlist(programs) ){
	print(p)
	print(nrow(subset(file, Program==p)))
	print(nrow(unique(subset(file, Program==p)['ID'])))
}
