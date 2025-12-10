library(readr)
library(tidyverse)

df <- read_csv("vgsales-12-4-2019-short.csv")

print(head(df))
df_compare <- df %>%
  mutate(Group = ifelse(Publisher == "Nintendo", "Nintendo", "Others"))

avg_scores <- df_compare %>%
  group_by(Group) %>% 
  summarise(avg_cs = mean(Critic_Score, na.rm = TRUE))

print (avg_scores)
print (df_compare)

boxplot(  Critic_Score ~ Group,  data = df_compare,  main = "Critic Scores: Nintendo vs Other Publishers",  xlab = "Publisher Group",  ylab = "Critic Score")

