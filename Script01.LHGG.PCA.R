

setwd("e:/cattle/05.联合攻关/07.PCA/")
# Calc variances explained by each PCA

variance <- read.delim("LHGGfilterPCA.eigenval",sep="\t",check.names=FALSE,header=FALSE)
PC1_Var=variance$V1[1]/sum(variance$V1)*100
PC2_Var=variance$V1[2]/sum(variance$V1)*100
PC3_Var=variance$V1[3]/sum(variance$V1)*100
PC4_Var=variance$V1[4]/sum(variance$V1)*100
PC5_Var=variance$V1[5]/sum(variance$V1)*100
PC6_Var=variance$V1[6]/sum(variance$V1)*100


data <- read.delim('LHGGfilterPCA.eigenvec.txt',sep='\t',check.names=FALSE,header=TRUE)

library(ggplot2)

mycols<-c("purple","blue","magenta","green","orange","brown","black")
myshapes <- c(0:6)

poplevels=c("Farm 1","Farm 2","Farm 3","Farm 4","Farm 5","Farm 6")



# for PC1 and PC2

path = "e:/cattle/05.联合攻关/07.PCA"
LHGG_PCA1_2<- ggplot(data=data,aes(x=PC1,y=PC2,label=Ind))+
  geom_point(aes(shape=factor(Pop,order=TRUE,levels=poplevels),
                 color=factor(Pop,order=TRUE,levels=poplevels)),size=2,
             position=position_jitter(width=0.008))+
  xlab(paste0("PC1 (", round(PC1_Var,2), "% variance)"))+
  ylab(paste0("PC2 (", round(PC2_Var,2), "% variance"))+
  ggtitle("PCA of Genotypes of Chinese Holsteins")+
  theme_bw()+
  scale_colour_manual(values=mycols,name="Farm")+
  scale_shape_manual(values=myshapes,name="Farm")+
  theme(panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        axis.title.x=element_text(colour="red",size=12),
        axis.title.y=element_text(colour="red",size=12),
        plot.title=element_text(colour="red",size=12,face="bold",hjust=0.5),
        legend.title=element_text(colour="blue",size=12),
        legend.text=element_text(size=12)
  )
ggsave(filename="LHGG.PC1_PC2.png",plot=LHGG_PCA1_2,device="png",
       path=path,height=5,width=6,units="in",dpi=600)




# for PC3 and PC4

path = "e:/cattle/05.联合攻关/07.PCA"
LHGG_PCA3_4<- ggplot(data=data,aes(x=PC3,y=PC4,label=Ind))+
  geom_point(aes(shape=factor(Pop,order=TRUE,levels=poplevels),
                 color=factor(Pop,order=TRUE,levels=poplevels)),size=2,
             position=position_jitter(width=0.008))+
  xlab(paste0("PC3 (", round(PC3_Var,2), "% variance)"))+
  ylab(paste0("PC4 (", round(PC4_Var,2), "% variance"))+
  ggtitle("PCA of Genotypes of Chinese Holsteins")+
  theme_bw()+
  scale_colour_manual(values=mycols,name="Farm")+
  scale_shape_manual(values=myshapes,name="Farm")+
  theme(panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        axis.title.x=element_text(colour="red",size=12),
        axis.title.y=element_text(colour="red",size=12),
        plot.title=element_text(colour="red",size=12,face="bold",hjust=0.5),
        legend.title=element_text(colour="blue",size=12),
        legend.text=element_text(size=12)
  )
ggsave(filename="LHGG.PC3_PC4.png",plot=LHGG_PCA3_4,device="png",
       path=path,height=5,width=6,units="in",dpi=600)


