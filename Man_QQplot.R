library('data.table')
library('qqman')

file1 <- commandArgs(trailingOnly = TRUE)[1]
dirR <- commandArgs(trailingOnly = TRUE)[2]
title <- commandArgs(trailingOnly = TRUE)[3]
fmp <- fread(paste0(dirR,"/",file1), header = TRUE, stringsAsFactors = FALSE)
fmp2 <- subset(fmp, p_value < 0.001)

#Manhattan plot
pdf(paste0(dirR,"/",file1,".Man.pdf"))
manhattan(fmp2, chr='CHROM', bp='GENPOS', snp='ID',p='p_value',
          ylim = c(1, 30),
          main = paste0(title),
          cex = 0.45,
          cex.axis = 1.4,
          #col = c("indianred4", "maroon"),
          col = c("royalblue4", "deeppink4"),
          genomewideline = -log10(5e-08),
          suggestiveline = F )
dev.off()

#QQplot
#pdf(paste0(path,"/",file,".Man.pdf")
#manhattan(fmp, chr='CHR', bp='BP', snp='SNP',p='P',
#          ylim = c(1, 30),
#          main = ,
#          cex = 0.45,
#          cex.axis = 1.4,
##          #col = c("indianred4", "maroon"),
#          col = c("royalblue4", "deeppink4"),
#          genomewideline = -log10(5e-08),
#          suggestiveline = F )
#dev.off()

q()
