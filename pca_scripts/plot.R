library(tidyverse)

thiscohort <- commandArgs(trailingOnly=T)[1]

prefix=paste0(thiscohort, ".pruning.in.shortid.pca.evec.population")
read_tsv(paste(prefix,".tsv", sep="")) -> dat

color_table <- c(ASW="red", CEU="blue", CHB="darkorange", CHD="yellow3", GIH="cadetblue1", JPT="green4", LWK="pink", MEX="darkblue", MKK="tomato", TSI="dodgerblue", YRI="red4", 
                 JG1="violet", hg38="purple", ZF1="black", HX1.ragoo="pink", HG00268.ragoo="red", HG00514="blue", HG00733.ragoo="darkorange", 
                 HG01352.ragoo="yellow3", HG02059.ragoo="cadetblue1",  HG02106.ragoo="green4", HG02818.ragoo="darkblue", 
                 HG04217.ragoo="gold", AK1.ragoo="red4", 
                 jg1a.ragoo="yellow1", jg1b.ragoo="yellowgreen", jg1c.ragoo="yellow4")

shape_table <- c(hapmap=3, asm=19)

# PC1, PC2
g1 <- dat %>% 
    select(haplotype,PC1,PC2,population,type) %>% 
    arrange(desc(type)) %>% 
    ggplot() + 
      geom_point(aes(x=PC1, y=PC2, color=population, shape=type)) + 
      scale_colour_manual(values=color_table) + 
      scale_shape_manual(values=shape_table) +
      theme_bw() + 
      theme(legend.title=element_blank(), legend.text=element_text(size=15), 
            axis.text.x=element_text(size=15), axis.text.y=element_text(size=15), 
            axis.title.x=element_text(size=15), axis.title.y=element_text(size=15)) +
      xlab("PC1") + ylab("PC2") + 
      coord_fixed(ratio=((max(dat$PC1) - min(dat$PC1)) / (max(dat$PC2) - min(dat$PC2))))
   
ggsave(paste(prefix,".PC1.PC2.png", sep=""), g1)
ggsave(paste(prefix,".PC1.PC2.eps", sep=""), g1)


# PC2, PC3
g2 <- dat %>% 
    select(haplotype,PC2,PC3,population,type) %>% 
    arrange(desc(type)) %>% 
    ggplot() + 
      geom_point(aes(x=PC2, y=PC3, color=population, shape=type)) + 
      scale_colour_manual(values=color_table) + 
      scale_shape_manual(values=shape_table) +
      theme_bw() + 
      theme(legend.title=element_blank(), legend.text=element_text(size=15), 
            axis.text.x=element_text(size=15), axis.text.y=element_text(size=15), 
            axis.title.x=element_text(size=15), axis.title.y=element_text(size=15)) +
      xlab("PC2") + ylab("PC3") + 
      coord_fixed(ratio=((max(dat$PC2) - min(dat$PC2)) / (max(dat$PC3) - min(dat$PC3))))
   
ggsave(paste(prefix,".PC2.PC3.png", sep=""), g2)
ggsave(paste(prefix,".PC2.PC3.eps", sep=""), g2)


# PC1, PC3
g3 <- dat %>% 
    select(haplotype,PC1,PC3,population,type) %>% 
    arrange(desc(type)) %>% 
    ggplot() + 
      geom_point(aes(x=PC1, y=PC3, color=population, shape=type)) + 
      scale_colour_manual(values=color_table) + 
      scale_shape_manual(values=shape_table) +
      theme_bw() + 
      theme(legend.title=element_blank(), legend.text=element_text(size=15), 
            axis.text.x=element_text(size=15), axis.text.y=element_text(size=15), 
            axis.title.x=element_text(size=15), axis.title.y=element_text(size=15)) +
      xlab("PC1") + ylab("PC3") + 
      coord_fixed(ratio=((max(dat$PC1) - min(dat$PC1)) / (max(dat$PC3) - min(dat$PC3))))
   
ggsave(paste(prefix,".PC1.PC3.png", sep=""), g3)
ggsave(paste(prefix,".PC1.PC3.eps", sep=""), g3)


