library(ggplot2)

my_theme = theme(
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(),
  panel.border = element_rect(color = "black",
                              fill = NA,
                              linewidth = 0.5),
  panel.background = element_rect(fill = NA),
  legend.text = element_text(size = 8),
  axis.text = element_text(size = 8,
                           color = "black"),
  axis.title = element_text(size = 8,
                            color = "black"),
  axis.line = element_blank(),
  plot.title = element_text(size = 8))