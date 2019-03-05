unzip -p ${DATAFILE} |
cut --delimiter=, --fields=3,8,52 |
sort --unique |
cat > transaction_new.csv

