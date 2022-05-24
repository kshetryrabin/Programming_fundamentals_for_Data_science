# R portfolio 1
library(tidyr)
library(dplyr)
library(readr)
library(tidyverse)
# accessing the who data using tidyr::who 
who<-tidyr::who

# viewing the data 
View(who)
# gathering together the data from multiple columns
# renaming new data as who1
who1<-who %>% pivot_longer(
  cols = new_sp_m014:newrel_f65,
  names_to = "key",
  values_to = "cases",
  values_drop_na = TRUE
)
# viewing the who1 dataset
who1<-who

# replacing newrel with new_rel in key column 
# renaming updated dataset as who2
#who2<- who1 %>% stringr::str_replace (key, "newrel", "new_rel")
# viewing who2
#View(who2)

#whο3 <- who1 %>% 
 # separate(key, c("new", "type", "sexage"), sep = "_")
who4<-who1


#displaying first and last 5 rows of who4
head(who4, n=5)
tail(who4, n=5)
# writing who4 into a csv file
write.csv(who4, "C:/Users/Desktop/who4.csv")

# R portfolio 2 

# viewing the heads of iris dataset
head(iris)
# calculating the mean of sepal length
mean(iris$Sepal.Length)
# calculating the median of sepal length
median(iris$Sepal.Length)
# calculating the mode of sepal length
mode(iris$Sepal.Length)
# calculating the minimum of sepal length
min(iris$Sepal.Length, na.rm=TRUE)
# calculating the maximum of sepal length
max(iris$Sepal.Length, na.rm=TRUE)
# calculating the range of sepal length
range(iris$Sepal.Length, na.rm=TRUE)

# calculating the inter quartile range of sepal length
IQR(iris$Sepal.Length, na.rm=TRUE)
# calculating the quantiles of sepal length
quantile(iris$Sepal.Length, na.rm=TRUE)
# calculating the variance of sepal length
var(iris$Sepal.Length, na.rm=TRUE)
# calculating the standard deviation of sepal length
sd(iris$Sepal.Length, na.rm=TRUE)
# finding min, max, mean, median, 1st and 3rd quartiles of sepal length at once
summary(iris$Sepal.Length)
#Using sapply to compute mean and quantile for each column
sapply(iris, mean, na.rm=TRUE)
sapply(iris$Sepal.Length, quantile)
#sort(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width)
# creating histogram
hist(iris$Sepal.Length, main = "Histogram for sepal length", xlab=" sepal length cm", xlim = c(4,8), col = "red")
# creating boxplot for sepal length, sepal width, petal length, petal width
boxplot(iris)
# QQ plot for sepal length
qqnorm(iris$Sepal.Length)
# QQ plot for sepal length with reference line
qqline(iris$Sepal.Length, col='#008000', lwd=2, lty=2)

# R portfolio 3
mpg <-ggplot2::mpg
View(mpg)

# using ggplot to visualize between manufacturer and city and highway
ggplot(mpg, aes(x = manufacturer, y = hwy, size = cty)) +
  geom_point()

# using facet_wrap to categorise the variables
ggplot(mpg, aes(x = displ, y = cty)) +
  geom_point() +
  facet_wrap( ~ class)

#using facet_grid to categorise with multiple variables
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = cty)) +
  facet_grid(drv ~ cyl~class)