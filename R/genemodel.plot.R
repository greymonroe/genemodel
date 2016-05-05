#'genemodel.plot
#'
#' This function plots a gene model
#'
#' @param model data.frame containing model information. Required columns are "type", "coordinates"
#' @param start start position
#' @param bpstop stop position
#' @param orientation either "foward" or "reverse" indicates the direction of transcription
#' @param xaxis default is TRUE and adds axis above gene model showing position
#' @export
#' @examples
#' data(AT5G62640)
#' genemodel.plot(AT5G62640, 25149433, 25152541, "reverse", xaxis=T)


genemodel.plot<-function(model, start, bpstop, orientation, xaxis=T)
{
  par(mar=c(1,1,3,1), cex=1)
  model<-cbind(model[,1], as.data.frame(stringr::str_split_fixed(model$coordinates, "-", 2)))
  colnames(model)<-c("feature", "start", "bpstop")
  model$start<-as.numeric(as.character(model$start));model$bpstop<-as.numeric(as.character(model$bpstop))

  length<-bpstop-start

  if (orientation=="reverse")
  {
    model$newstart<-bpstop-model$bpstop+1
    model$newstop<-bpstop-model$start+1
    model<-model[which(model$feature!="exon"),]
    model<-model[which(model$feature!="ORF"),]
    model<-model[order(model$newstart),]

    plot(1, type="l",axes=F,ann=FALSE, xlim=c(start-.03*length, bpstop), ylim=c(-1, .5))
    for (i in 2:nrow(model))
    {
      type<-model$feature[i]

      if (type=="coding_region")
      {
        rect(model$newstart[i], 0, model$newstop[i], .2, col = "steelblue3", border="dodgerblue4", lwd=1)

      }

      if (type=="intron")
      {

        mid<-mean(c(model$newstart[i], model$newstop[i]))
        segments(x0=model$newstart[i],y0=.1,x1=mid,y1=.2, lwd=1, col="dodgerblue4")
        segments(x0=model$newstop[i],y0=.1,x1=mid,y1=.2, lwd=1, col="dodgerblue4")
      }

      if (type=="3' utr")
      {
        rect(model$newstart[i], 0, model$newstop[i], .2, col = "lightsteelblue1", border="dodgerblue4", lwd=1)

      }
      if (type=="5' utr")
      {
        rect(model$newstart[i], 0, model$newstop[i], .2, col = "lightsteelblue1", border="dodgerblue4", lwd=1)

      }
    }
    x<-c(model$newstop[1], model$newstop[1], model$newstart[1], start-.02*length, model$newstart[1])
    y<-c(0,.2,.2,.1,0)
    endtype<-model$feature[1]
    if (endtype=="coding_region") polygon(x,y, border = "dodgerblue4" , col ="steelblue3" , lwd=1)
    else polygon(x,y, border = "dodgerblue4" , col ="lightsteelblue1" , lwd=1)
  }

  if (orientation=="forward")
  {
    model$newstart<-start+model$start-1
    model$newstop<-start+model$bpstop-1
    model<-model[which(model$feature!="exon"),]
    model<-model[which(model$feature!="ORF"),]
    model<-model[order(model$newstop, decreasing = T),]

    plot(1, type="l",yaxt='n',ann=FALSE, xlim=c(start, bpstop+.03*length), ylim=c(-1, .5))
    for (i in 2:nrow(model))
    {
      type<-model$feature[i]

      if (type=="coding_region")
      {
        rect(model$newstart[i], 0, model$newstop[i], .2, col = "steelblue3", border="dodgerblue4", lwd=1)

      }

      if (type=="intron")
      {

        mid<-mean(c(model$newstart[i], model$newstop[i]))
        segments(x0=model$newstart[i],y0=.1,x1=mid,y1=.2, lwd=1, col="dodgerblue4")
        segments(x0=model$newstop[i],y0=.1,x1=mid,y1=.2, lwd=1, col="dodgerblue4")
      }

      if (type=="3' utr")
      {
        rect(model$newstart[i], 0, model$newstop[i], .2, col = "lightsteelblue1", border="dodgerblue4", lwd=1)

      }
      if (type=="5' utr")
      {
        rect(model$newstart[i], 0, model$newstop[i], .2, col = "lightsteelblue1", border="dodgerblue4", lwd=1)

      }
    }
    x<-c(model$newstart[1], model$newstart[1], model$newstop[1], bpstop+.02*length, model$newstop[1])
    y<-c(0,.2,.2,.1,0)
    endtype<-model$feature[1]
    if (endtype=="coding_region") {polygon(x,y, border = "dodgerblue4" , col ="steelblue3" , lwd=1) }
    else {polygon(x,y, border = "dodgerblue4" , col ="lightsteelblue1" , lwd=1)}
  }
  if (xaxis==T)
  {
    Axis(side=3, labels=T)
    }
}
