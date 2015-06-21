df <- read.fwf("D:\\academic\\datasciencecoursera\\getting-and-cleaning-data\\data\\getdata-wksst8110.for",widths=c(10,9,4,9,4,9,4,9,4),skip=4)

colSums(df[4])
