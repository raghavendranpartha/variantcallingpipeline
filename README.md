# variantcallingpipeline

## This R script runs a variant calling pipeline using VarScan and further annotates the variants using ANNOVAR

## The program requires the following software to be installed:

## SAMTOOLS - http://samtools.sourceforge.net/
## VarScan - http://massgenomics.org/varscan
## ANNOVAR - http://annovar.openbioinformatics.org/en/latest/


## Pipeline overview
The program further requires as input a bam file containing preprocessed human sample alignment. Using the hg19 genome as reference, SAMtools mpileup command is run to obtain a summary of the coverage of the mapped reads. This output is then subsequently used as the input for VarScan which calls consensus genotypes including SNPs and indels and reports the output in variant call format VCF. This VCF file is then piped to ANNOVAR which generates an output tab-delimited VCF file with additional annotation information. In order to run, the program first downloads the hg19 refGene database files which are used for variant annotation, including the reference gene on which the variant is present as well as any amino acid changes associated with the variant.