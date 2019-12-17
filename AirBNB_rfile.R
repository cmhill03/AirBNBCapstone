
train_set<-get(load(file="train_set.RData"))
test_set<-get(load(file="test_set.RData"))
validation_set<-get(load(file="validation_set.RData"))

if(!require(caret))
  install.packages("caret", repos = "http://cran.us.r-project.org")
library(caret)

train_lm<-train(price ~ room_type+neighbourhood_group+minimum_nights, data = train_set, method = "lm")
preds<-predict(train_lm, validation_set)
RMSE(validation_set$price, preds)