### functions to calculate age in years, months, or days
library(eeptools)
library(lubridate)

age_y <- function(dob, age.day = today(), units = "years", floor = F) {
  calc.age = interval(dob, age.day) / duration(num = 1, units = units)
  if (floor) return(as.integer(floor(calc.age)))
  return(calc.age)
}

age_m <- function(dob, age.day = today(), units = "months", floor = F) {
  calc.age = interval(dob, age.day) / duration(num = 1, units = units)
  if (floor) return(as.integer(floor(calc.age)))
  return(calc.age)
}

age_d <- function(dob, age.day = today(), units = "days", floor = F) {
  calc.age = interval(dob, age.day) / duration(num = 1, units = units)
  if (floor) return(as.integer(floor(calc.age)))
  return(calc.age)
}

## ex. df$ageiny <- age_y(df$dob, df$date1)
