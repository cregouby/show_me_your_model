# model studio exploration
library(modelStudio)
load(here::here("toulouse_appartements.Rda"))

rf_model <- ranger(prix_m2 ~ ., data = appartements, num.trees = 300,
                   importance = "impurity", seed = 2323)
rf_predict <- predict(rf_model, appartements_test)

glm_model <- glm(prix_m2 ~ ., data = appartements)
glm_predict <- predict(glm_model, appartements_test)

lm_expln <- explain(glm_model, label = "glm", data = appartements_test, y = appartements_test$prix_m2)

p.fun <- function(model,data) {
  predict(model,data, num.trees=300)$predictions
}
rf_expln <- explain(rf_model, label = "rf",  data = appartements_test, y = appartements_test$prix_m2, predict.function = p.fun)

modelStudio(rf_expln, appartements_test[2,])