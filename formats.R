# formatting variables

## formatting yes/no categorical variables
form_yn <- function(x){
  factor(x, 1:2, c("Yes", "No"))
}

## formatting replacing common abbreviations of medications with their full names
form_med_abb <- function(x){
  
  # function that generates regex pattern to look for medication at beginning of string 
  # or any point in comma-delimited string of all medications each patient is taking
  look_eryywhere <- function(y){regex(paste0("^", y, "|(?<=\\s)", y, "(?=\\s)"))}
  
  # Tylenol as Acetaminophen
  str_replace_all(
    # Hctz as Hydrochlorothiazide
    string = str_replace_all(
      # albuterol inhaler as albuterol
      string = str_replace_all(
        # Replace Ibu as Ibuprofen
        string = str_replace_all(
          # replace Nsaid as Nonsteroidal Anti-Inflammatory Drug
          string = str_replace_all(
            # replace ASA as Aspirin
            string = str_replace_all(
              string = str_to_title(x), # capitalize each Word to standardize capitalization
              pattern = look_eryywhere("Asa"), 
              replacement = "Aspirin"
              ),
            pattern = look_eryywhere("Nsaid"),
            replacement = "Nonsteroidal Anti-Inflammatory Drug"
          ),
          pattern = look_eryywhere("Ibu"),
          replacement = "Ibuprofen"
        ),
        pattern = look_eryywhere("Albuterol Inhaler"),
        replacement = "Albuterol"
      ),
      pattern = look_eryywhere("Hctz"),
      replacement = "Hydrochlorothiazide"
    ),
    pattern = look_eryywhere("Tylenol"),
    replacement = "Acetaminophen"
  )
}
