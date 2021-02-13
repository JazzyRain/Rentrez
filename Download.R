install.packages("rentrez")## includeinstall the rentrez package
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")#set new object containing 3 string name, each representing a different NCBI accession number
library(rentrez)  # load the rentrez package to process data through the molecular biology database system
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")# entrez_fetch takes a vector of id which we compile together as ncbi_ids previously. here we want to see the transcript of nucleotide therefore we set db='nuccore' and we want to fetch the DNA sequence in FASTA format, hence rettype="fasta". after describing what we want, we save this as a new object called Bburg
Bburg##we call out the object to check the content. it contains 3 different seqeucne of the 16S gene of Borrelia burgdorferi (aka Borreliella burgdorferi) , which is a bacteria that causes Lyme Disease.

Sequences<-strsplit(Bburg, "\n\n") #split the large pile of text into sequences. we seperate text to the next number/list whenever "\n\n" occurs 
Sequences<-unlist(Sequences) ## set list as dataframe 
Sequences## call out the Sequence object to check contents

header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)# a new header object that include things all excluding sequences
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)#a new sequence object that contain sequence only
seq<-gsub("[\n]","",seq)# modify the sequence object that that all new line characters are removed 
Sequences<-data.frame(Name=header,Sequence=seq) #compile the seperated header object and seuquence together as a new object but all content are sorted based on their own category/object (ex all header together/ all sequence together)
Sequences## call out the object to check on the contents
write.csv(Sequences,"./Sequences.csv")