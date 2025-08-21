
sc_theme_guides = guides(x = axis, 
                         y = axis) 

sc_theme_axes = theme(axis.line = element_line(),
                      axis.title = element_text(hjust = 0))


umap_theme = theme(panel.border = element_rect(color = "black"),
                   axis.line = element_blank(),                   
                   axis.ticks = element_blank(),
                   axis.text = element_blank(),
                   axis.title = element_text(hjust = 0,
                                             size = 8))

umap_labs =   labs(x = "UMAP 1",y = "UMAP 2")