---
title: "genemodel Tutorial"
author: "J Grey Monroe"
date: "2016-05-05"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Vignette Title}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---


This package provides a simple way to make positionally accurate plots of gene models similar to those found on The Arabidopsis Information Resource (TAIR). These plots are suitable for presentations and publications where showing gene models is appropriate to comunicate genetic research.  

### Installation

To install the package:

```r
install_bitbucket("greymonroe/genemodel")
library(genemodel)
```

### Example  
Now lets look at an example gene that we are going to model. This is gene is `AT5G62640`. The original gene model information can be found here http://www.arabidopsis.org/servlets/TairObject?type=gene&id=1000654517. It is stored in the `Gene Feature` table on that page. 
<img src="/Users/greymonroe/Desktop/AT5G62640_TAIR_Features.png" height="300px" width="300px" />  
...  
  
  
Once this table is extracted and saved as .csv or .txt table file, it can be loaded into R as a data.frame object. The package *genemodel* has this data already stored and can be loaded like this:


```r
data("AT5G62640")
```

When we look at the strucutre of this data.frame,

```r
head(AT5G62640, 15)
```

```
##             type coordinates
## 1            ORF    191-2958
## 2         5' utr       1-190
## 3  coding_region     191-271
## 4  coding_region     551-625
## 5  coding_region     689-782
## 6  coding_region    959-1029
## 7  coding_region   1155-1210
## 8  coding_region   1321-1372
## 9  coding_region   1449-1530
## 10 coding_region   1631-2004
## 11 coding_region   2124-2633
## 12 coding_region   2731-2958
## 13          exon       1-271
## 14        intron     272-550
## 15          exon     551-625
```
we see that it is a two column data.frame with the first column being the name of the feature type and the second specifying the coordinate position within the gene model that the feature occupies. 

The feature types that TAIR provides in the `Gene Feature` table for gene models are:
* ORF - the Open Reading Frame which extends from the first to last exon
* Coding Region - segments of the gene that code RNA  
* 5` UTR - Untranlated Region.  
* Exon   
* Intron  
* 3` UTR  

### genemodel.plot function

Before we can plot the gene, we need to extract some other information from the TAIR gene model description. First we need the start and stop base pair positions for the gene. These can be found in the `Map Locations` section of the TAIR gene model page and correspond to the `Coordinates` of  `Map Type`  'nuc_sequence.' Next weed the direction of transcription which can also be found in the `Map Locations` section under `Orientation`. Again we want the value for corresponding the `Map Type` that equals 'nuc_sequence' See image below from TAIR.
<img src="/Users/greymonroe/Desktop/AT5G62640_TAIR_Map_Locations.png" height="50px" width="700px" />  


We now have the information necessary to plot the gene with `genemodel.plot`






