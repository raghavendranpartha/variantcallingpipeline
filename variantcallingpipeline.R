args <- commandArgs(trailingOnly = T)

inputbamfile <- args[1]
#inputbamfile <- 'bam_files/primerclipped.bam'
bampileup <- gsub(".bam",".mpileup",inputbamfile)
cmd1 <- paste0("/home/raghav/Software/samtools-1.2/samtools mpileup -f ./humangenome/hg19.fa -BA -d9999 -Q 20 -q 30 ",inputbamfile," > ",bampileup)
system(cmd1)

varscanvcfout <- paste0(bampileup,'.varscan.vcf')

cmd2 <- paste0("java -jar ./VarScan.v2.3.9.jar mpileup2cns ",bampileup," --variants 1 --output-vcf 1 --strand-filter 0 --min-var-freq 0.01 > ",varscanvcfout)
system(cmd2)

cmd3 <- "perl ./annovar/annotate_variation.pl -buildver hg19 -downdb -webfrom annovar refGene humandb/"
system(cmd3)

annovarout <- gsub(".vcf","",varscanvcfout)

cmd4 <- paste0("perl ./annovar/table_annovar.pl ",varscanvcfout," humandb/ -buildver hg19 -out ",annovarout," -remove -protocol refGene -operation g -nastring . -vcfinput")
system(cmd4)
