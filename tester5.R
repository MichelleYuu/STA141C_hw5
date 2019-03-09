
#!bin/usr/env Rscript

##Testing in R

connection = file("stdin")
open(connection, blocking=TRUE)

dataframe = read.csv(connection, header=FALSE)

data2_table=table(dataframe)

q=prop.table(colSums(data2_table))

KLD4=function(p){
  #q=as.vector(BenFord(1:9))
  #q=prop.table(colSums((data3)))
  sum(sapply(1:length(p), function(x){ifelse(p[x]==0,0, (p[x]/sum(p))*(log((p[x]/sum(p)))-log(q[x])) ) } )) 
}

KLD_dist=apply(data2_table, MARGIN =1, FUN=KLD4)

write.csv(KLD_dist, file='KLD_dist.csv')

#Collobarated with Kevin Chu, Biying (Phoebe) Zhang
