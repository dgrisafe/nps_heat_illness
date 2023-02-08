# formatting variables

## formatting yes/no categorical variables
form_yn <- function(x){
  factor(x, 1:2, c("Yes", "No"))
}
