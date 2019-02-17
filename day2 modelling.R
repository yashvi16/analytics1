# modelling
# linear regression- simple, multiple
#y~ x1(SLR);y~x1=x2...(MLR)
#y~ dependent variable, x- independent

head(women)
# ^ y- weight, x- height
cor(women$height,women$weight) 
# correlation - strenght and direction of relationship( here its strongly related)
cov(women$height,women$weight) 
# covariance - tells the direction(here its +ve) of relationship(+ve/-ve)
# height increases , weight increases
plot(women$height,women$weight)
#peform linear modelling
fit1=lm(weight~height,data=women) # ~ =dependent
# ^ fit1= name of model, lm= linear modelling
summary(fit1)
#look at fstats frm summary n then at pvalue
#F stats pvalue << 0.05:linear model exist(here)
# atleast 1 independent variable(IV) is significant in predicting dv
# multiple r square= .991 coeff of determination
# if 1 IV then multiple r sq but if more than 1 IV then adjusted r sq
#99% of the variation in y is explained by x
#y=mx+c; y=-87+3.45*height
range(women$height)
# only do interpolation not exterpolation
women$height
women$weight
(y= -87+3.45*women$height)
# these are predicted weights for actual heights
fitted(fit1) # predicted values
residuals(fit1) #difference between predicted and actual weights
summary(fit1)
summary(residuals(fit1))
summary(students$marks1)
(newdata1=data.frame(height=c(10.4,59.9)))
(p1=predict(fit1,newdata=newdata1,type='response'))
cbind(newdata1,p1)

# check for assumptions of linear regression
plot(fit1)




