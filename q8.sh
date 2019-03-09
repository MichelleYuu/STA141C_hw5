# remove last row because it is the column headers
   sed '$d' transaction_new.csv |
   cat > transaction_new2.csv
 
   # get the first digit
   cut -d',' -f2 transaction_new2.csv |
   cut -c-1 |
   cat > first_digit.csv
 
   # combine with parent_ID
   paste -d"," transaction_new2.csv first_digit.csv |
   cut -d"," -f3,4 > ID_digit.csv
