
library(tidyverse)

# Histograms

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))


ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5)

diamonds %>%
  count(cut_width(carat, 0.5))

smaller <- diamonds %>%
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 0.01) 

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.25)

# Frequency Plot
ggplot(data = smaller, mapping = aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)


# Outliers

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)

# Zoom in
ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

# Get outliers
unusual <- diamonds %>%
  filter(y < 3 | y > 20) %>%
  select(price, x, y, z) %>%
  arrange(y)

unusual


# Covariation

# view density - "the count standardization so that the area under each frequency polygon is one
ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

# Boxplot might make comparison clearer
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

# Order boxplot by increasing values of hwy
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()

# Categorical Variables - Covariation
diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

# Continuous Variables - Covariation

# Use transparency to see points better
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 / 100)

# Use bins to see points better - color shows the number of points in each bin
ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

# Bin with boxplots

# Use bin width to create boxplots
ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))

# Use same number of points in each bin
ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))

# Patterns and Models

ggplot(data = faithful) + 
  geom_point(mapping = aes(x = eruptions, y = waiting))
