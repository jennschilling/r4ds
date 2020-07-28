
# Chapter 3 - Data Visualization

library(tidyverse)

# Use the mpg dataset
dat <- mpg

glimpse(dat)

# Scatterplots

ggplot(data = dat) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


ggplot(data = dat) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ year, nrow = 2)


ggplot(data = dat) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)


# Fitted Line Plot

ggplot(data = dat) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = dat) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = dat, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()

ggplot(data = dat, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(dat, class == "subcompact"), se = FALSE)

# Bar Charts

# Count
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

# Proportion
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))

# Stat Summary
ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


# Position Adjustments

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter()

ggplot(data = mpg, mapping = aes(y = cty)) +
  geom_boxplot()


# Coordinate Systems

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

bar <- ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = cut),
    show.legend = FALSE,
    width = 1
  ) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)
  
bar + coord_flip()

bar + coord_polar()



# Code Template for Graphing:

### ggplot(data = <DATA>) +
###   <GEOM_FUNCTION>(
###     mapping = aes(<MAPPINGS>),
###     stat = <STAT>,
###     position = <POSITION>
###   ) +
###   <COORDINATE_FUNCTION> +
###   <FACET_FUNCTION>
