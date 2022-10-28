setwd("E:/cattle/05.联合攻关/06.体型分关联分析/")

library(qqman)

names <- c("Angularity","Body_depth","Bone_quality","Central_ligament","Chest_width","Foot_angle",
           "Foot_heel_depth","Fore_udder_attachment","Front_teat_length","Front_teat_length",
           "Front_teat_placement","Rear_leg_rear_view","Rear_leg_side_view","Rear_teat_placement",
           "Rear_udder_height","Rear_udder_width","Rump_angle","Rump_width","Stature","Udder_depth",
           "Waist_strength")

modtype <- "lm2"

for (pheno in names){
 
  pdfname <- paste("assoc.plot/function.",modtype,"/",pheno,".",modtype,".assoc.FDR.pdf",sep="")
  readfile <- paste("typescores.assoc/function.",modtype,"/",pheno,".",modtype,".assoc.txt",sep="")
  fdrfile <- paste("typescores.assoc/function.",modtype,"/",pheno,".",modtype,".assoc.FDR.txt",sep="")
  
  pdf(pdfname)
  mydata <- read.table(readfile,header=TRUE,sep="\t")
  mydata$FDR <- p.adjust(mydata$p_lrt,method="fdr",n=length(mydata$p_lrt))
  write.table(mydata,fdrfile,sep="\t",quote=FALSE)
  
  mydata$rs <- as.character(mydata$rs)
  mydata$chr <- as.integer(mydata$chr)
  
  manhattan(mydata, chr="chr",bp="ps",p="FDR",snp="rs",col=c("green","blue"),
            chrlabs=NULL,suggestiveline=-log10(0.05),genomewideline=-log10(0.01),
            highlight=NULL, logp=TRUE,annotatePval=NULL,annotateTop=TRUE)
  dev.off()

}













