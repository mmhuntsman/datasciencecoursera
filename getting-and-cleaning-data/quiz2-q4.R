con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlCode


#htmlCode[10]
nchar(htmlCode[10])

#htmlCode[20]
nchar(htmlCode[20])

#htmlCode[30]
nchar(htmlCode[30])

#htmlCode[100]
nchar(htmlCode[100])
