install.packages("rentrez")## install the rentrez package
library(rentrez)  # load the rentrez package to process data through the molecular biology database system

Cov2<-entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")##find nucleotide sequence by accession number
Cov2##output genome

Spro<-entrez_fetch(db = "protein", id = "YP_009724390.1", rettype = "fasta_cds_na")#we found the proteinID on NCBI based on position. we will use it to output its cds in fasta format

Spro<-gsub("[\n]","",Spro)# modify the sequence object that that all new line characters are removed 
Spro<-gsub(".*[CDS]]","",Spro) # the sequence is modified so that all items before and including "CDS" are removed 
Spro ##output sequence 
##BLAST
##Looking at the E  value which indicates the likelihood of matches by chance. Since the E valuue for most options are low, this suggests the protein is conserved through the evolutionary time and it is unlikely to be evolving 