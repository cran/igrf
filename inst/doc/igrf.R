## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
# load the library
library(igrf)

df <- igrf(
  field = "main",
  year = 2000,
  altitude = 2,
  latitude = 0,
  longitude = 0
)

print(df)

## -----------------------------------------------------------------------------
grid <- igrf::igrf_grid(
  field = "main",
  year = 2000,
  altitude = 2,
  resolution = 5
  )

print(head(grid))

## ----message=FALSE, results='hide'--------------------------------------------
library(ggplot2)
library(metR)
library(rnaturalearth)

coast <- ne_coastline(returnclass = "sf")

ggplot(grid) +
  geom_contour_fill(
    aes(
      lon,
      lat,
      z = D
    ),
    breaks = MakeBreaks(10)
  ) +
  geom_sf(
    data = coast
  ) +
  scale_fill_divergent(
    name = "declination"
  ) +
  labs(
    x = "",
    y = "",
    title = "IGRF magnetic declination"
  ) +
  theme_bw() +
  theme(
    plot.background = element_rect(fill = "#ffffff", color = NA),
    panel.background = element_rect(fill = "#ffffff", color = NA)
  )

