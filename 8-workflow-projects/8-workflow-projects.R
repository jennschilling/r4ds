library(tidyverse)
library(hexbin)

# Save plot
ggplot(diamonds, aes(carat, price)) + 
  geom_hex()
ggsave("8-workflow-projects\\diamonds.pdf")

# Save CSV
write_csv(diamonds, "8-workflow-projects\\diamonds.csv")
