echo "Start subject to program"
Rscript test.R ../Q53.csv 53SUBPRO.csv
echo "53 - Finished"
Rscript test.R ../Q54.csv 54SUBPRO.csv
echo "54 - Finished"
Rscript test.R ../Q55.csv 55SUBPRO.csv
echo "55 - Finished"
Rscript test.R ../Q56.csv 56SUBPRO.csv
echo "56 - Finished"
Rscript test.R ../Q57.csv 57SUBPRO.csv
echo "57 - Finished"
Rscript merge.R 
echo "Complete!!!"
