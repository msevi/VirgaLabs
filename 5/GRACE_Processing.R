setwd("~/Documents/Glasgow/PhD/Courses/Spring2016Semester/CIVE 5699 Remote Sensing/HW7") #set working directory
df<-read.table("TWSA_output.txt",header = FALSE, sep="\t") #input file (output of Professor's code)
colnames(df)<-c("date", "lat", "lon", "JPL", "CSR", "GFZ", "scale", "leake", "mease") #columnn names
sJPL<- df$JPL*df$scale #calculate scaled measurement
df<- cbind(df, sJPL) #bind column to existing data frame
sCSR<- df$CSR*df$scale #calculate scaled measurement
df<- cbind(df, sCSR) #bind column to existing data frame
sGFZ<- df$GFZ*df$scale #calculate scaled measurement
df<- cbind(df, sGFZ) #bind column to existing data frame

table<-aggregate(df, by=list(df$date), FUN=mean) # Group by date and take the mean value of columns within them
table$Group.1<- NULL #drop unwanted column
write.table(table, "Mean_by_date.txt", sep = "\t",quote = FALSE, row.names = FALSE) #write output table to manipulate in Excel

############################################################################################
############################################################################################
############################################################################################

df<- df[ , -which(names(df) %in% c("JPL", "CSR", "GFZ", "scale", "sJPL", "sCSR", "sGFZ"))] #drop unwanted columns
rowno<- numeric() #create an empty vector 

###determine when the dates change
n<- nrow(df) - 1
for (i in 1:n) {
  if (df$date[i]-df$date[i+1] != 0){
    rowno<- c(rowno,as.numeric(i))
  }
  else{
    rowno<- rowno
  }
}

rowno<-c(0,rowno,3725) #append first and last row numbers


############################################################################################
############################################################################################
############################################################################################

##Calculate error
R=6371
clip<- data.frame()
sumtable<- data.frame(matrix(nrow=length(rowno)-1,ncol=6))
colnames(sumtable)<- c("leakem", "measem", "tperror", "rleake", "rmease", "rerror")
n<-(length(rowno)-1)
for (i in 1:n){
  clip<-df[((rowno[i]+1):rowno[i+1]),]
  rleake<-matrix(ncol = 25, nrow = 25)
  rmease<-matrix(ncol = 25, nrow = 25)
  dlon<-matrix(ncol = 25, nrow = 25)
  dlat<-matrix(ncol = 25, nrow = 25)
  sumlat<-matrix(ncol = 25, nrow = 25)
  mlat<-matrix(ncol = 25, nrow = 25)
  dist<-matrix(ncol = 25, nrow = 25)
  rleake<-matrix(ncol = 25, nrow = 25)
  rmease<-matrix(ncol = 25, nrow = 25)
  for (j in 1:25){
    for (k in 1:25){
      dlon[j,k]<- (pi/180)*(clip$lon[j]-clip$lon[k])
      dlat[j,k]<- (pi/180)*(clip$lat[j]-clip$lat[k])
      sumlat[j,k]<-(clip$lat[j]+clip$lat[k])/2
      mlat[j,k]<- (pi/180)*sumlat[j,k]
      dist[j,k]<- R*sqrt((cos(mlat[j,k])*dlon[j,k])^2 + dlat[j,k]^2)
      rleake[j,k]<- clip$leake[j] * clip$leake[k] * (exp(-dist[j,k]^2/(2*100)))
      rmease[j,k]<- clip$mease[j] * clip$mease[k] * (exp(-dist[j,k]^2/(2*300)))
    }
  }  
  sumtable[i,"rleake"]<- sqrt((1/25)*(1/25)*sum(rleake))
  sumtable[i,"rmease"]<- sqrt((1/25)*(1/25)*sum(rmease))
  sumtable[i,"rerror"]<- sqrt((sumtable[i,"rmease"])^2 + (sumtable[i,"rmease"])^2)
  sumtable[i,"leakem"]<- mean(clip$leake)
  sumtable[i,"measem"]<- mean(clip$mease)
  sumtable[i,"tperror"]<-sqrt((sumtable[i,"leakem"])^2 + (sumtable[i,"measem"])^2)
}

write.table(sumtable, "Error_summary.txt", sep = "\t",quote = FALSE, row.names = FALSE) #write output table with errors




