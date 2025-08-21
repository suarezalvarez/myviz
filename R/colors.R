# Jennifer Fransson

library(ggplot2)
library(RColorBrewer)

#' Generate a List of Colors
#'
#' This function returns a specified number of colors from a predefined palette.
#'
#' @param n Integer. The number of colors to return. Must be 18 or smaller.
#' @return A character vector of hexadecimal color codes.
#' @details The function selects colors based on a predefined index order and 
#'          returns the first `n` colors in the sorted order.
#' @examples
#' # Get the first 5 colors
#' get_color_list(5)
#'
#' # Get all 18 colors
#' get_color_list(18)
#'
#' @export
get_color_list = function(n){
  indeces = c(1,11,5,7,15,14,16,13,6,9,17,2,10,8,3,4,12,18)
  
  if(n>18) stop("n must be 18 or smaller")
  c("#9E1531","#C66A27","#F3953A","#C9971D","#F9C027","#DDE48A",
    "#97C13A","#64A638","#174E3F","#43ADA8","#3C87EA","#7863A9",
    "#C9CDFF","#1C124A","#6D1C8C","#CF2561","#EC8483","#ECAFC6")[sort(indeces[1:n])]
}




# vector of blue, red, green

red_blue_green = c(brewer.pal(3,"Set1")[2],
                        brewer.pal(3,"Set1")[1],
                        brewer.pal(3,"Set1")[3])