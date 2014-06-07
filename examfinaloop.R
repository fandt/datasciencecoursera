library(httr)
library(XML)

#get only name, as list, from exam's linkedin address
exam<-read.csv("C:\\Users\\Rebecca\\Downloads\\exam.csv",header = FALSE,sep=",")
i<- 1
for (i in i:1000){
linkedin<-as.character(exam[i,2])
facebook<-as.character(exam[i,1])
lname<-substring(linkedin,30,nchar(linkedin)-11)
lname2<-unlist(strsplit(lname,"-"))
searchname<-lname2[2]

#load page source from FB
page<-GET(facebook)

#get real link to FB page
newlink<-(page[1])
newlink2<-as.character(newlink)
pagereal<-GET(newlink2)
x<-content(page)

#test for linkedin searchname in source code
answer<-grepl(searchname,pagereal)
print(answer)
}