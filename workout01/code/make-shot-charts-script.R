getwd()

library(ggplot2)
library(grid)
install.packages("jpeg")
library(jpeg)

help(rasterGrob)

court_file <- "Desktop/stat133/workout01/images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

klay_shot_chart <- 
  ggplot(klay, aes(x = x, y = y, color = shot_made_flag)) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point() +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()

curry_shot_chart <-
  ggplot(curry, aes(x = x, y = y, color = shot_made_flag)) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point() +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()

andre_shot_chart <-
  ggplot(andre, aes(x = x, y = y, color = shot_made_flag)) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point() +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()

kevin_shot_chart <-
  ggplot(kevin, aes(x = x, y = y, color = shot_made_flag)) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point() +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()

draymond_shot_chart <-
  ggplot(draymond, aes(x = x, y = y, color = shot_made_flag)) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point() +
  ylim(-50, 420) +
  labs(x = "", y = "", title = "Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()

getwd()

andre_shot_chart
ggsave(file = "Desktop/stat133/workout01/images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5, units = "in")

curry_shot_chart
ggsave(file = "Desktop/stat133/workout01/images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)

draymond_shot_chart
ggsave(file = "Desktop/stat133/workout01/images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)

klay_shot_chart
ggsave(file = "Desktop/stat133/workout01/images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)

kevin_shot_chart
ggsave(file = "Desktop/stat133/workout01/images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
