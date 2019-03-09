#!bin/usr/env Rscript

##Testing in R

connection = file("stdin")
open(connection, blocking=TRUE)

##1

dataframe = read.csv(connection, header=FALSE)

#dataframe=read.csv(connection, colClasses=c('parent_recipient_unique_id' = 'character') )

#colnames(dataframe) = c('action_date', 'total_obligation', 'parent_recipient_unique_id')

names(dataframe)[1] = "action_date"
names(dataframe)[2] = "total_obligation"
names(dataframe)[3] = "parent_recipient_unique_id"

dataframe$'total_obligation' = strtrim(dataframe$'total_obligation', 1)

dataframe2 = dataframe[!(dataframe$'total_obligation' == 0 |  dataframe$'total_obligation' == '-'),]

dataframe3=dataframe2[,c(3,2)]

##3

#print(dataframe2)

#print(dataframe3)

#dataframe3_new=table(dataframe3)

dataframe3_new = dataframe2[dataframe2$'parent_recipient_unique_id' %in% names(which(table(dataframe2$'parent_recipient_unique_id') >= 100)), ]

#print(dataframe3_new)

#dataframe4=dataframe3_new[rowSums(dataframe3_new) >= 100,]

#print(dataframe4)

#dataframe4=dataframe3[c(2,3)]

#dataframe5 = dataframe4[!(dataframe4$'total_obligation' == 0 |  dataframe4$'total_obligation' == '-' | dataframe4$'total_obligation' == ''),]

#table(dataframe3$'parent_recipient_unique_id')

#print(dataframe4)

write.csv(dataframe3, file='results8.csv')

#Collobarated with Kevin Chu, Biying (Phoebe) Zhang
