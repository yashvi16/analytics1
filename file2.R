#my first r file
#comment by starting with # to make notes or comment
women
#control + enter to execute command
?women
?mean
# write "?" before function to seek help
mtcars
mean(mtcars$mpg)
names(mtcars)
mean(mtcars$hp)
colMeans(mtcars)
rowMeans(mtcars)      
head(mtcars,1) # first row
head(mtcars) # first 6 rows
tail(mtcars,1) # last row
tail(mtcars) # last6 rows
hist(mtcars$mpg,breaks=3) 
# without breaks is only histogram
# with breaks means only 3 intervals
#vectors
x=c(1,2,5,7)
x
class(x) 3 #we are creating data sets
x1=c(2L,8L)
class(x1)
class(mtcars)
x3=c("a",'b','yashvi')
x3
class(x3)
x4=c(TRUE,FALSE,T,F)
x4
x5=1:100000
x5
x6<-2 # another way of assigning; other is =
(x7=rnorm(1000)) # this is normal distribution
# if put () fpr whole command then np need for separate command of x7
length(x7)
mean(x7)
sd(x7)
plot(density(x7))
hist(x7,breaks=6)
hist(x7,freq=F) #to overlay
points(density(x7)) #to overlay
(x8=rnorm(100,mean=60,sd=10))
length(x8)
mean(x8)
plot(density(x8))
hist(x8)
hist(x8,freq=F)
points(density(x8))
library(e1071) # installed
kurtosis(x8) # shape of dist.; it is -ve bcoz it is platykurtic
skewness(x8) # shape of dist.; its +ve bcoz its right skewed
x9= runif(100,30,90) # uniform dist; vecto of hundred values starting from 30-90
?runif
x9
trunc(x9) #remove decimal places
?trunc
round(x9,1) # till dceimal as demanded
floor(x9) # 39.6=39
ceiling(x9)    # 39.2=40
x10=ceiling(x9) # created new vector x10 of ceiling values in x9
x10
mean(x10)
median(x10)    
sort(x10) #arranging in ascending order
sort(x10,decreasing=T) # arranging in descending order
x10[x10>60] # marks greater then 60
# by position from below
x10[1:10] # marks of first 10 students
x10
x10[20:30] # marks of students that r atno. 20-30
x10[-c(1:20)] #marks of all students exept no 1-20
x10    

#matrices
m1=matrix(1:24,nrow=6) #  creation of matrix
# nrow= number of rows
# specify either row or column not both
m1
dim(m1)
?dim # dimentions i.e row;column
m2=matrix(1:56,ncol=8)
m2
# ncol= number of columns
m3=matrix(1:24,ncol=6,byrow=T)
m3
# default way of storing is in column but byrow changes the way to row
colnames(m3)=month.abb[1:6]
# abb= abbreviation; these are 1st six months
m3                      
rownames(m3)=paste('Product',1:4,sep='_')
# paste function
m3
rowMeans(m3)
colMeans(m3)         
rowSums(m3)
colSums(m3)
m1
m1[ ,1:2] # only 1st 2 columnc
m1[1:3, ] # only 1st 3 rows
m3[c(1,3), ] # only row 1&3
colMeans(m3[c(1,3), ])
m3[ ,c('Apr','Jun')]   
max(m3) # highest sales
min(m3)
range(m3)
# which row/column does max(m3) signify

# data frame from below
n=30
rollno=1:30
(rollno=paste('F',1:30,sep='_')) # for alphanumeric rollno
(sname=paste('Student',1:30 ,sep='&'))
(gender=sample(c('M','F'), size=n, replace=T))
# for classifying gender^
table(gender) # for counting the no.of male and female
set.seed(1234) # before sample command for a same patternof data
?set.seed #the pattern of data changes
(gender=sample(c('M','F'), size=n,replace=T,prob=c(.7,.3)))
# for classifying M & F as per requirement ^
table(gender)
(t1=table(gender))
prop.table(t1)
?prop.table # gives the %
set.seed(12)
(college=sample(c('SRCC','FMS','IIM'),size=n,replace=T,prob=c(.4,.3,.3)))
(t2=table(college)) # distribution count
prop.table(t2) # %
(marks1=round(rnorm(n=n,mean=60,sd=10),0)) # 0= round of to 0 decimal place
(marks2=round(rnorm(n=n,mean=55,sd=15),0))
rollno;sname;gender;college;marks1;marks2 # these are vectors
length(gender)

students=data.frame(rollno,sname,gender,college,marks1,marks2)
class(students)
head(students)
students # data frame
# data from has column heads and not row headsbut row numbers
students$rollno
students[ ,c(2,5:6)] # partricular columns req
students[ ,c('sname','marks1','marks2')]
# either of 142 &143 can be done
str(students) # structure
summary(students) # har column ka summary acc to factor and numeric
quantile(students$marks1)
# default division is 1/4,1/2,3/4,1
# quantile=25%
#decile=10%
quantile(students$marks1, probs=seq(0,1,.1))
?seq
# seq= from 0 to 1 with interval of .1
quantile(students$marks1, probs=seq(0,1,.25))
seq(from=1,to=100,by=3) # sequence function
summary(students)
str(students)
students$rollno=as.character(students$rollno)
students$sname=as.character(students$rollno)
# changing category/factor to character type
str(students)
summary(students)
head(students)
write.csv(students,'fms.csv',row.names=F)
students2=read.csv('fms.csv')          
head(students2)
students3=read.csv(file.choose()) # for selecting  a file
head(students3)
str(students)
#students
head(students)
library(dplyr)
students[students$marks1>60, ] 
students[students$gender=='F', ]                 
# == is for checking of equality whereas = for assigning
students[students$gender=='F'| students$college=='SRCC', ]
# highest from all college
#dplyr down
students%>%filter(gender=='M' & marks1>60)
students%>%group_by(gender) %>% summarise(max(marks1),max(marks2))
students%>%group_by(college) %>% summarise(max(marks1),max(marks2))
students%>% filter(college=='FMS')%>% select(marks1,marks2)
