library(data.table)
library(base)

# assign and read data set
bikesStolen <- read.csv("C:/Users/Danyuhl/Desktop/Data Sets/Bike Thefts.csv", header = TRUE)
bikesStolen <- data.table(bikesStolen)
head(bikesStolen)

#check the structure of the dataset
str(bikesStolen)

#Check how much data is missing 
bikesStolen$Day.of.Week[bikesStolen$Day.of.Week == "Unknown"] <- NA 
(sum(is.na(bikesStolen$Day.of.Week))/length(bikesStolen$Day.of.Week)) * 100 
bikesStolen$Day.of.Week
str(bikesStolen)
table(bikesStolen$Day.of.Week)
##ignore for now

#regular expression
bikesStolen$Location <- as.character(bikesStolen$Location)
#changes factor variables to character

find.anacapa <- agrep("anacapa", bikesStolen$Location,ignore.case = TRUE)
bikesStolen$Location[find.anacapa] <- "ANACAPA"

find.arbor <- agrep("arbor", bikesStolen$Location,ignore.case = TRUE)
bikesStolen$Location[find.arbor] <- "ARBOR"

find.library <- agrep("library", bikesStolen$Location,ignore.case = TRUE)
bikesStolen$Location[find.library] <- "LIBRARY"

find.ft <- grep("ft", bikesStolen$Location, ignore.case = TRUE, fixed = FALSE)
bikesStolen$Location[find.ft] <- "FT"

find.art <- grep("^art", bikesStolen$Location, ignore.case = TRUE, fixed = FALSE)
bikesStolen$Location[find.art] <- "ARTS BUILDING"

find.sancat <- grep("cat", bikesStolen$Location, ignore.case = TRUE, fixed = FALSE)
bikesStolen$Location[find.sancat] <- "FT"

find.ortega <- grep("ortega", bikesStolen$Location, ignore.case = T, fixed = F)
bikesStolen$Location[find.ortega] <- "ORTEGA"

find.hssb <- grep("hssb", bikesStolen$Location, ignore.case = T, fixed = F)
bikesStolen$Location[find.hssb] <- "HSSB"

find.carrillo <- grep("illo", bikesStolen$Location, ignore.case = T, fixed = F)
bikesStolen$Location[find.carrillo] <- "CARRILLO"

find.srb <- grep("srb", bikesStolen$Location, ignore.case = T, fixed = F)
bikesStolen$Location[find.srb] <- "SRB"

find.srb2 <- grep("resource", bikesStolen$Location, ignore.case = T, fixed = F)
bikesStolen$Location[find.srb2] <- "SRB"

find.broida <- grep("broida", bikesStolen$Location, ignore.case = T, fixed = F)
bikesStolen$Location[find.broida] <- "BROIDA"
