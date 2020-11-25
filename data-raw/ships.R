## code to prepare `ship` dataset goes here
ships <- readr::read_csv("ships.csv")
usethis::use_data(ships, overwrite = TRUE)
