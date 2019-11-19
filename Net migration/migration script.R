### Load packages & import data

migration <- read.csv("Net migration rate.csv")
library(tidyverse)

### Clean data

migration <- gather(migration, X1960..YR1960.:X2019..YR2019., key = "Year", value = "Net_migration_rate")

migration$Year <- substr(migration$Year, 10, 13)

migration$Net_migration_rate <- as.numeric(migration$Net_migration_rate)

### Look at high net migration

high_migration <- filter(migration, Net_migration_rate >= .1)
