library(scotus)
library(dplyr)

scotus_filtered <- scotus_full %>%
  filter(nchar(text) > 1000) %>%
  sample_n(size = 10000)
lobstr::obj_size(scotus_filtered)

use_data(scotus_filtered, overwrite = TRUE)
