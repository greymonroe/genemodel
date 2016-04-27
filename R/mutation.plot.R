#' mutation.plot
#'
#' This function plots mutations along genemodels created with genemodel.plot
#'
#' @param start start position
#' @param stop stop position
#' @param text any text that you want displayed on the label
#' @param drop how far below the gene model you want the mutation label to be placed
#' @param col the color of the text and mutation line to be
#' @param haplotypes the color of dots that you want to place along the mutation line to indicate some factor such as haplotype that the mutation belongs to
#' @export
#' @examples
#'
#'

mutation.plot<-function(start, stop, text, drop=-0.15, col, haplotypes=NULL)
{
  rect(start, .2, stop, drop+.01*length(haplotypes), col=col, border=col)
  text( stop, drop, text, cex=0.7, col=col, pos=4, offset=0.1+.1*length(haplotypes))
  for (i in 1:length(haplotypes)) points(stop, drop-0.05+(i-1)*0.1, col=haplotypes[i], pch=20, cex=1)
}
