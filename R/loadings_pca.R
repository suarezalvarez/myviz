library(ggplot2)


#' Create a Loadings Plot for Principal Component Analysis
#'
#' This function generates a plot of the top positive and negative loadings for a specified principal component.
#'
#' @param PC_object A PCA object containing the rotation matrix (e.g., from `prcomp`).
#' @param PC_number Integer. The principal component number to visualize.
#' @param number_of_genes Integer. The number of top positive and negative loadings to include in the plot.
#' @return A ggplot object representing the loadings plot.
#' @details The function creates a plot showing the top `number_of_genes` positive and negative loadings for the specified principal component. 
#'          The loadings are displayed as points, with labels for the corresponding genes.
#' @examples
#' # Assuming `pca_result` is a PCA object from prcomp:
#' create_loadings_plot(pca_result, PC_number = 1, number_of_genes = 10)
#'
#' @export
create_loadings_plot = function(PC_object, PC_number, number_of_genes){
  
  loadings_df = data.frame(
    rank = as.factor(c(1:number_of_genes, 1:number_of_genes)),
    gene = c(names(PC_object$rotation[,PC_number] |> sort(decreasing = T) |> head(number_of_genes)), names(PC_object$rotation[,PC_number] |> sort() |> head(number_of_genes))),
    loading = c(PC_object$rotation[,PC_number] |> sort(decreasing = T) |> head(number_of_genes),PC_object$rotation[,PC_number] |> sort() |> head(number_of_genes)),
    sign = as.factor(c(rep("pos", number_of_genes), rep("neg", number_of_genes)))
  )
   
  loadings_df$rank = factor(loadings_df$rank, levels = rev(levels(loadings_df$rank)))
  
  ggplot(loadings_df, aes(x = loading, 
                          y = rank)) +
    geom_point(aes(color = sign),
               size = 3,
               alpha = .5)  +
    my_theme +
    scale_color_manual(values = c(brewer.pal(3,"Set1")[2],
                                 brewer.pal(3,"Set1")[1])) +
    
    theme(axis.text.y = element_blank(),
          axis.title.y = element_blank(),
          axis.text.x = element_text(size = 8, 
                                 color = "black"),
          axis.title.x = element_text(size = 8,
                                      color = "black"),
          axis.ticks.y = element_blank(),
          panel.grid = element_blank(),
          axis.ticks.x = element_line(),
          legend.position = "none",
          panel.border = element_rect(fill = NA,
                                      color = "black",
                                      linewidth = .5)) + 
    
    scale_x_continuous(expand = expansion(mult = .5)) +
    
    geom_text(aes(label = ifelse(sign == "neg",
                                 paste(gene, " "),
                                 paste(" ",gene))), 
              hjust = ifelse(loadings_df$sign == "neg",1,0) , 
              size = 3, fontface = "italic") +
    
    labs(title = paste("PC",PC_number))
}