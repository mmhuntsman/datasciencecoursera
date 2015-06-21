

# Question 1

setwd("D:\\academic\\datasciencecoursera\\getting-and-cleaning-data")

if(!file.exists("data")){
  dir.create("data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile = "./data/quiz1-q1.csv")
list.files("./data")

dateDownloaded <- date()
dateDownloaded

data <- read.table("./data/quiz1-q1.csv", header = TRUE,sep = ",")

# head(data)

results <- subset(data,VAL>=24, select=VAL)

nrow(results)

# 53



# Question 3

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,destfile = "./data/quiz1-q3.xlsx",mode="wb")
list.files("./data")

colIndex <- 7:15
rowindex <- 18:23
  
library(xlsx)

dat <- read.xlsx("./data/quiz1-q3.xlsx", header = TRUE, sheetIndex=1, colIndex=colIndex, rowIndex=rowindex)

#dat

sum(dat$Zip*dat$Ext,na.rm=T) 

#36534720



# Question 4

library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)

rootNode <- xmlRoot(doc)
zip <- xpathSApply(rootNode,"//zipcode", xmlValue)


split(zip,zip[])

#127



# Question 5

