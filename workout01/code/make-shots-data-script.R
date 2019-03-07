#Title: Global Table for Player Data
#Description: Table of the various variables required for the data visualization portion of the project.
#Input(s):
#Output(s): 


library(dplyr)
getwd()
data_types <- c("character", "character", "double", "double", "integer", "integer", "factor", "factor", "factor", "double", "character", "double", "double")
curry <- read.csv("Desktop/stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE, colClasses = data_types)
andre <- read.csv("Desktop/stat133/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE, colClasses = data_types)
kevin <- read.csv("Desktop/stat133/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE, colClasses = data_types)
klay <- read.csv("Desktop/stat133/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE, colClasses = data_types)
draymond <- read.csv("Desktop/stat133/workout01/data/draymond-green.csv", stringsAsFactors = FALSE, colClasses = data_types)

curry <- mutate(curry, player_name = "Stephen Curry")
andre <- mutate(andre, player_name = "Andre Iguodala")
kevin <- mutate(kevin, player_name = "Kevin Durant")
klay <- mutate(klay, player_name = "Klay Thompson")
draymond <- mutate(draymond, player_name = "Draymond Green")

levels(curry$shot_made_flag) <- c("shot_no", "shot_yes")
levels(andre$shot_made_flag) <- c("shot_no", "shot_yes")
levels(kevin$shot_made_flag) <- c("shot_no", "shot_yes")
levels(klay$shot_made_flag) <- c("shot_no", "shot_yes")
levels(draymond$shot_made_flag) <- c("shot_no", "shot_yes")

curry <- mutate(curry, minute = (15*period - minutes_remaining))
klay <- mutate(klay, minute = (15*period - minutes_remaining))
draymond <- mutate(draymond, minute = (15*period - minutes_remaining))
kevin <- mutate(kevin, minute = (15*period - minutes_remaining))
andre <- mutate(andre, minute = (15*period - minutes_remaining))

sink("Desktop/stat133/workout01/output/stephen-curry-summary.txt")
summary(curry)
sink()

sink("Desktop/stat133/workout01/output/klay-thompson-summary.txt")
summary(klay)
sink()

sink("Desktop/stat133/workout01/output/draymond-green-summary.txt")
summary(draymond)
sink()

sink("Desktop/stat133/workout01/output/kevin-durant-summary.txt")
print(summary(kevin))
sink()

sink("Desktop/stat133/workout01/output/andre-iguodala-summary.txt")
print(summary(andre))
sink()

shots_data <- rbind(andre, draymond, klay, curry, kevin)

write.csv(
  x = shots_data,
  file = "Desktop/stat133/workout01/data/shots-data.csv"
)

sink("Desktop/stat133/workout01/output/shots-data-summary.txt")
print(summary(shots_data))
sink()
