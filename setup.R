options(
  tidyverse.quiet = TRUE, 
  propensity.quiet = TRUE,
  tipr.verbose = FALSE,
  htmltools.dir.version = FALSE, 
  width = 55, 
  digits = 4,
  ggplot2.discrete.colour = ggokabeito::palette_okabe_ito(),
  ggplot2.discrete.fill = ggokabeito::palette_okabe_ito(),
  ggplot2.continuous.colour = "viridis",
  ggplot2.continuous.fill = "viridis",
  book.base_family = "sans",
  book.base_size = 14
)

library(tidyverse)

theme_set(
  theme_minimal(
    base_size = getOption("book.base_size"), 
    base_family = getOption("book.base_family")
  ) %+replace% 
    theme(
      panel.grid.minor = element_blank(),
      legend.position = "bottom"
    )
)

theme_dag <- function() {
  ggdag::theme_dag(base_family = getOption("book.base_family"))
}

geom_dag_label_repel <- function(..., seed = 10) {
  ggdag::geom_dag_label_repel(
    aes(x, y, label = label),
    box.padding = 3.5, 
    inherit.aes = FALSE,
    max.overlaps = Inf, 
    family = getOption("book.base_family"),
    seed = seed,
    label.size = NA, 
    label.padding = 0.1,
    size = getOption("book.base_size") / 3,
    ...
  ) 
}
