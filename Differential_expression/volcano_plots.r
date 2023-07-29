pdf("Volcano_plots.pdf",width=10,height=7)
library(EnhancedVolcano)

petsp <- read.table("Petal_specific_tau1.uniprot.list")
pedsp <- read.table("Pedicel_specific_tau1.uniprot.list")
budsp <- read.table("Bud_specific_tau1.uniprot.list")

a <- read.table("NO_PRL.gene.counts.matrix.PRB_vs_PRPD.edgeR.DE_results.uniprot.txt",header=T)
a$gene_symbols <- gsub('_[^_]*$', '', a$Uniprot_ID)

#keyvals.colour <- ifelse(a$Uniprot_ID %in% petsp$V1 & b$logFC < -2, 'yellow',ifelse(b$Uniprot_ID %in% pedsp$V1 & b$logFC > 2, 'red', ifelse(b$PValue < 0.001 & b$logFC > 2 | b$PValue < 0.001 & b$logFC < -2, 'green', 'black')))

keyvals.colour <- ifelse(a$Uniprot_ID %in% budsp$V1, 'blue', ifelse(a$Uniprot_ID %in% petsp$V1, 'purple', ifelse(a$Uniprot_ID %in% pedsp$V1, 'red', ifelse(a$PValue < 0.001 & a$logFC > 2 | a$PValue < 0.001 & a$logFC < -2, 'green', 'black'))))

keyvals.colour[is.na(keyvals.colour)] <- 'black'
names(keyvals.colour)[keyvals.colour == 'purple'] <- 'Petal-specific'
names(keyvals.colour)[keyvals.colour == 'red'] <- 'Pedicel-specific'
names(keyvals.colour)[keyvals.colour == 'blue'] <- 'Bud-specific'
names(keyvals.colour)[keyvals.colour == 'green'] <- 'p-value < 0.001 and FC > 2'
names(keyvals.colour)[keyvals.colour == 'black'] <- 'n.s.'

#A <- EnhancedVolcano(a,lab ='',x = 'logFC', y= 'PValue', pCutoff = 0.001, FCcutoff = 2, title = 'Bud vs Pedicel',subtitle='', xlab = bquote(~Log[2]~ 'fold change'), colCustom = keyvals.colour, legendPosition='bottom', titleLabSize = 40, captionLabSize = 35, cutoffLineWidth = 4, pointSize = 18, labSize = 40, legendLabSize = 40, legendIconSize = 25)

A <- EnhancedVolcano(a,lab ='',x = 'logFC', y= 'PValue', pCutoff = 0.001, FCcutoff = 2, title = 'Bud vs Pedicel',subtitle='', xlab = bquote(~Log[2]~ 'fold change'), colCustom = keyvals.colour, legendLabels="")

A
#jpeg("PRB_PRPD_volcano.jpeg", res=300,width=2000,height=1500)
#A
#dev.off()

#############

b <- read.table("NO_PRL.gene.counts.matrix.PRPD_vs_PRP.edgeR.DE_results.uniprot.txt",header=T)
b$gene_symbols <- gsub('_[^_]*$', '', b$Uniprot_ID)

keyvals.colour <- ifelse(b$Uniprot_ID %in% budsp$V1, 'blue', ifelse(b$Uniprot_ID %in% petsp$V1, 'purple', ifelse(b$Uniprot_ID %in% pedsp$V1, 'red', ifelse(b$PValue < 0.001 & b$logFC > 2 | b$PValue < 0.001 & b$logFC < -2, 'green', 'black'))))

keyvals.colour[is.na(keyvals.colour)] <- 'black'
names(keyvals.colour)[keyvals.colour == 'purple'] <- 'Petal-specific'
names(keyvals.colour)[keyvals.colour == 'red'] <- 'Pedicel-specific'
names(keyvals.colour)[keyvals.colour == 'blue'] <- 'Bud-specific'
names(keyvals.colour)[keyvals.colour == 'green'] <- 'p-value < 0.001 and FC > 2'
names(keyvals.colour)[keyvals.colour == 'black'] <- 'n.s.'

EnhancedVolcano(b,lab ='',x = 'logFC', y= 'PValue', pCutoff = 0.001, FCcutoff = 2, title = 'Pedicel vs Petal',subtitle='', xlab = bquote(~Log[2]~ 'fold change'),colCustom = keyvals.colour,legendPosition='bottom')

#################

c <- read.table("NO_PRL.gene.counts.matrix.PRB_vs_PRP.edgeR.DE_results.uniprot.txt",header=T)
c$gene_symbols <- gsub('_[^_]*$', '', c$Uniprot_ID)

keyvals.colour <- ifelse(c$Uniprot_ID %in% budsp$V1, 'blue', ifelse(c$Uniprot_ID %in% petsp$V1, 'purple', ifelse(c$Uniprot_ID %in% pedsp$V1, 'red', ifelse(c$PValue < 0.001 & c$logFC > 2 | c$PValue < 0.001 & c$logFC < -2, 'green', 'black'))))

keyvals.colour[is.na(keyvals.colour)] <- 'black'
names(keyvals.colour)[keyvals.colour == 'purple'] <- 'Petal-specific'
names(keyvals.colour)[keyvals.colour == 'red'] <- 'Pedicel-specific'
names(keyvals.colour)[keyvals.colour == 'blue'] <- 'Bud-specific'
names(keyvals.colour)[keyvals.colour == 'green'] <- 'p-value < 0.001 and FC > 2'
names(keyvals.colour)[keyvals.colour == 'black'] <- 'n.s.'

EnhancedVolcano(c,lab ='',x = 'logFC', y= 'PValue', pCutoff = 0.001, FCcutoff = 2, title = 'Bud vs Petal',subtitle='', xlab = bquote(~Log[2]~ 'fold change'),colCustom = keyvals.colour,legendPosition='bottom')

#################

library(EnhancedVolcano)

petsp <- read.table("Petal_specific_tau1.uniprot.list")
pedsp <- read.table("Pedicel_specific_tau1.uniprot.list")
budsp <- read.table("Bud_specific_tau1.uniprot.list")

a <- read.table("NO_PRL.gene.counts.matrix.PRB_vs_PRPD.edgeR.DE_results.uniprot.txt",header=T)
a$gene_symbols <- gsub('_[^_]*$', '', a$Uniprot_ID)

keyvals.colour <- ifelse(a$Uniprot_ID %in% budsp$V1 & a$logFC > 0, 'blue', ifelse(a$Uniprot_ID %in% petsp$V1, 'purple', ifelse(a$Uniprot_ID %in% pedsp$V1 & a$logFC < -0, 'red', ifelse(a$PValue < 0.001 & a$logFC > 2 | a$PValue < 0.001 & a$logFC < -2, 'green', 'black'))))

keyvals.colour[is.na(keyvals.colour)] <- 'black'
names(keyvals.colour)[keyvals.colour == 'purple'] <- 'Petal-specific'
names(keyvals.colour)[keyvals.colour == 'red'] <- 'Pedicel-specific'
names(keyvals.colour)[keyvals.colour == 'blue'] <- 'Bud-specific'
names(keyvals.colour)[keyvals.colour == 'green'] <- 'p-value < 0.001 and FC > 2'
names(keyvals.colour)[keyvals.colour == 'black'] <- 'n.s.'

A <- EnhancedVolcano(a,lab ='',x = 'logFC', y= 'PValue', pCutoff = 0.001, FCcutoff = 2, title = 'Bud vs Pedicel',subtitle='', xlab = bquote(~Log[2]~ 'fold change'),colCustom = keyvals.colour,legendPosition='bottom')

jpeg("PRB_PRPD_volcano.jpeg", res=300,width=3000,height=2000)
A
dev.off()

#############

b <- read.table("NO_PRL.gene.counts.matrix.PRPD_vs_PRP.edgeR.DE_results.uniprot.txt",header=T)
b$gene_symbols <- gsub('_[^_]*$', '', b$Uniprot_ID)

keyvals.colour <- ifelse(b$Uniprot_ID %in% budsp$V1, 'blue', ifelse(b$Uniprot_ID %in% petsp$V1, 'purple', ifelse(b$Uniprot_ID %in% pedsp$V1 & b$logFC > 0, 'red', ifelse(b$PValue < 0.001 & b$logFC > 2 | b$PValue < 0.001 & b$logFC < -0, 'green', 'black'))))

keyvals.colour[is.na(keyvals.colour)] <- 'black'
names(keyvals.colour)[keyvals.colour == 'purple'] <- 'Petal-specific'
names(keyvals.colour)[keyvals.colour == 'red'] <- 'Pedicel-specific'
names(keyvals.colour)[keyvals.colour == 'blue'] <- 'Bud-specific'
names(keyvals.colour)[keyvals.colour == 'green'] <- 'p-value < 0.001 and FC > 2'
names(keyvals.colour)[keyvals.colour == 'black'] <- 'n.s.'

A <- EnhancedVolcano(b,lab ='',x = 'logFC', y= 'PValue', pCutoff = 0.001, FCcutoff = 2, title = 'Pedicel vs Petal',subtitle='', xlab = bquote(~Log[2]~ 'fold change'),colCustom = keyvals.colour,legendPosition='bottom')

jpeg("PRPD_PRP_volcano.jpeg", res=300,width=3000,height=2000)
A
dev.off()

#################

c <- read.table("NO_PRL.gene.counts.matrix.PRB_vs_PRP.edgeR.DE_results.uniprot.txt",header=T)
c$gene_symbols <- gsub('_[^_]*$', '', c$Uniprot_ID)

keyvals.colour <- ifelse(c$Uniprot_ID %in% budsp$V1 & c$logFC > 0, 'blue', ifelse(c$Uniprot_ID %in% petsp$V1 & c$logFC < -0, 'purple', ifelse(c$Uniprot_ID %in% pedsp$V1, 'red', ifelse(c$PValue < 0.001 & c$logFC > 2 | c$PValue < 0.001 & c$logFC < -2, 'green', 'black'))))

keyvals.colour[is.na(keyvals.colour)] <- 'black'
names(keyvals.colour)[keyvals.colour == 'purple'] <- 'Petal-specific'
names(keyvals.colour)[keyvals.colour == 'red'] <- 'Pedicel-specific'
names(keyvals.colour)[keyvals.colour == 'blue'] <- 'Bud-specific'
names(keyvals.colour)[keyvals.colour == 'green'] <- 'p-value < 0.001 and FC > 2'
names(keyvals.colour)[keyvals.colour == 'black'] <- 'n.s.'

A <- EnhancedVolcano(c,lab ='',x = 'logFC', y= 'PValue', pCutoff = 0.001, FCcutoff = 2, title = 'Bud vs Petal',subtitle='', xlab = bquote(~Log[2]~ 'fold change'),colCustom = keyvals.colour,legendPosition='bottom')

jpeg("PRB_PRP_volcano.jpeg", res=300,width=3000,height=2000)
A
dev.off()


