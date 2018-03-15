# Data Pre-processing
#Read file
Dataset= read.csv('Salary_Data.csv')
#Dataset = Dataset[,2:3]

#Splitting data into training and test data
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(Dataset$Salary, SplitRatio = 2/3)
training_set = subset(Dataset, split == TRUE)
test_set = subset(Dataset, split == FALSE)

#Feature_Scaling
#training_set[,2:3] = scale(training_set[,2:3])
#test_set[,2:3] = scale(test_set[,2:3])


#Fitting simple linear regression
regressor= lm(formula = Salary ~ YearsExperience,
              data = training_set)

#Predict 
y_pred = predict(regressor, newdata = test_set)


#Visualize for Training set
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue')+
  ggtitle('Salary vs YearsExperience')+
  xlab('YearsExperience')+
  ylab('Salary')

#Visualize for test set
#install.packages('ggplot2')
library(ggplot2)
ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue')+
  ggtitle('Salary vs YearsExperience')+
  xlab('YearsExperience')+
  ylab('Salary')