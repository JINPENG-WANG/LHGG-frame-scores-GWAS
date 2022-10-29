#!/usr/bin/R
library(ggplot2)
setwd("e:/cattle/05.联合攻关/06.体型分关联分析/assoc/linear/lm2.FDR/all/")

RUWD <- read.table("Rear_udder_width.lm2.assoc.FDR.txt",sep="\t",header=T)
FHD <- read.table("Foot_heel_depth.lm2.assoc.FDR.txt",sep="\t",header=T)
RLSV <- read.table("Rear_leg_side_view.lm2.assoc.FDR.txt",sep="\t",header=T)
FUA <- read.table("Fore_udder_attachment.lm2.assoc.FDR.txt",sep="\t",header=T)
RTP <- read.table("Rear_teat_placement.lm2.assoc.FDR.txt",sep="\t",header=T)

#RUWD
gwasResults <- RUWD
gwasResults$SNP1 <- seq(1, nrow(gwasResults), 1)
gwasResults$CHR <- factor(gwasResults$chr, levels = unique(gwasResults$chr))
chr <- aggregate(gwasResults$SNP1, by = list(gwasResults$CHR), FUN = median)
RUWDplot <- ggplot(gwasResults, aes(SNP1, -log(FDR, 10))) +
  annotate('rect', xmin = 0, xmax = max(gwasResults$SNP1), ymin = -log10(0.01), ymax = -log10(0.05), fill = 'gray98') +
  geom_hline(yintercept = c(-log10(0.05), -log10(0.01)), color = c("#F39B7FB2","#91D1C2B2"), size = 0.35) +
  geom_point(aes(color = CHR), show.legend = FALSE) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 15)) +
  scale_x_continuous(breaks = chr$x, labels = chr$Group.1, expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(1, 9, 2), labels = as.character(seq(1, 9, 2)), expand = c(0, 0), limits = c(0, 3)) +
  theme(panel.grid = element_blank(), axis.line = element_line(colour = 'black'), panel.background = element_rect(fill = 'transparent')) +
  labs(x = 'Chromosome', y = expression(''~-log[10]~'(FDR)'))+
  labs(title="RUWD")
  
#FHD
gwasResults <- FHD
gwasResults$SNP1 <- seq(1, nrow(gwasResults), 1)
gwasResults$CHR <- factor(gwasResults$chr, levels = unique(gwasResults$chr))
chr <- aggregate(gwasResults$SNP1, by = list(gwasResults$CHR), FUN = median)
FHDplot <- ggplot(gwasResults, aes(SNP1, -log(FDR, 10))) +
  annotate('rect', xmin = 0, xmax = max(gwasResults$SNP1), ymin = -log10(0.01), ymax = -log10(0.05), fill = 'gray98') +
  geom_hline(yintercept = c(-log10(0.05), -log10(0.01)), color = c("#F39B7FB2","#91D1C2B2"), size = 0.35) +
  geom_point(aes(color = CHR), show.legend = FALSE) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 15)) +
  scale_x_continuous(breaks = chr$x, labels = chr$Group.1, expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(1, 9, 2), labels = as.character(seq(1, 9, 2)), expand = c(0, 0), limits = c(0, 3)) +
  theme(panel.grid = element_blank(), axis.line = element_line(colour = 'black'), panel.background = element_rect(fill = 'transparent')) +
  labs(x = 'Chromosome', y = expression(''~-log[10]~'(FDR)'))+
  labs(title="FHD")
  
#RLSV
gwasResults <- RLSV
gwasResults$SNP1 <- seq(1, nrow(gwasResults), 1)
gwasResults$CHR <- factor(gwasResults$chr, levels = unique(gwasResults$chr))
chr <- aggregate(gwasResults$SNP1, by = list(gwasResults$CHR), FUN = median)
RLSVplot <- ggplot(gwasResults, aes(SNP1, -log(FDR, 10))) +
  annotate('rect', xmin = 0, xmax = max(gwasResults$SNP1), ymin = -log10(0.01), ymax = -log10(0.05), fill = 'gray98') +
  geom_hline(yintercept = c(-log10(0.05), -log10(0.01)), color = c("#F39B7FB2","#91D1C2B2"), size = 0.35) +
  geom_point(aes(color = CHR), show.legend = FALSE) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 15)) +
  scale_x_continuous(breaks = chr$x, labels = chr$Group.1, expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(1, 9, 2), labels = as.character(seq(1, 9, 2)), expand = c(0, 0), limits = c(0, 3)) +
  theme(panel.grid = element_blank(), axis.line = element_line(colour = 'black'), panel.background = element_rect(fill = 'transparent')) +
  labs(x = 'Chromosome', y = expression(''~-log[10]~'(FDR)'))+
  labs(title="RLSV")
  
#FUA
gwasResults <- FUA
gwasResults$SNP1 <- seq(1, nrow(gwasResults), 1)
gwasResults$CHR <- factor(gwasResults$chr, levels = unique(gwasResults$chr))
chr <- aggregate(gwasResults$SNP1, by = list(gwasResults$CHR), FUN = median)
FUAplot <- ggplot(gwasResults, aes(SNP1, -log(FDR, 10))) +
  annotate('rect', xmin = 0, xmax = max(gwasResults$SNP1), ymin = -log10(0.01), ymax = -log10(0.05), fill = 'gray98') +
  geom_hline(yintercept = c(-log10(0.05), -log10(0.01)), color = c("#F39B7FB2","#91D1C2B2"), size = 0.35) +
  geom_point(aes(color = CHR), show.legend = FALSE) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 15)) +
  scale_x_continuous(breaks = chr$x, labels = chr$Group.1, expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(1, 9, 2), labels = as.character(seq(1, 9, 2)), expand = c(0, 0), limits = c(0, 3)) +
  theme(panel.grid = element_blank(), axis.line = element_line(colour = 'black'), panel.background = element_rect(fill = 'transparent')) +
  labs(x = 'Chromosome', y = expression(''~-log[10]~'(FDR)'))+
  labs(title="FUA")
  
#RTP
gwasResults <- RTP
gwasResults$SNP1 <- seq(1, nrow(gwasResults), 1)
gwasResults$CHR <- factor(gwasResults$chr, levels = unique(gwasResults$chr))
chr <- aggregate(gwasResults$SNP1, by = list(gwasResults$CHR), FUN = median)
RTPplot <- ggplot(gwasResults, aes(SNP1, -log(FDR, 10))) +
  annotate('rect', xmin = 0, xmax = max(gwasResults$SNP1), ymin = -log10(0.01), ymax = -log10(0.05), fill = 'gray98') +
  geom_hline(yintercept = c(-log10(0.05), -log10(0.01)), color = c("#F39B7FB2","#91D1C2B2"), size = 0.35) +
  geom_point(aes(color = CHR), show.legend = FALSE) +
  scale_color_manual(values = rep(c("grey", "skyblue"), 15)) +
  scale_x_continuous(breaks = chr$x, labels = chr$Group.1, expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(1, 9, 2), labels = as.character(seq(1, 9, 2)), expand = c(0, 0), limits = c(0, 3)) +
  theme(panel.grid = element_blank(), axis.line = element_line(colour = 'black'), panel.background = element_rect(fill = 'transparent')) +
  labs(x = 'Chromosome', y = expression(''~-log[10]~'(FDR)'))+
  labs(title="RTP")
  
library(ggpubr)
p<- ggarrange(RUWDplot,FHDplot,RLSVplot,FUAplot,RTPplot,
              ncol=1,nrow=5,align="hv")
ggsave(file="five.traits.gwas.png",plot=p,device="png",dpi=600,height=10,width=8,units="in")
 
