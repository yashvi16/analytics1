# graphs

mtcars
names(mtcars)
table(mtcars$cyl)
table(mtcars$cyl,mtcars$am)
mtcars$mpg
# continuous data^- histogram,boxplot
hist(mtcars$mpg)
boxplot(mtcars$mpg,horizontal = T)
?boxplot-----
boxplot(mpg~gear,data=mtcars,col=1:3)
t1=table(mtcars$gear)
t1
barplot(t1,col=1:3)
barplot(c(10,3,5))
pie(c(10,3,5))
students
t2=table(students$college)
t2
barplot(t2)
t3=table(students$gender)
barplot(t3)
title('This is bar plot', sub='Subtitle') #gg plot cheat sheet
pie(t3)
