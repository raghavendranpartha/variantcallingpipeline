# variantcallingpipeline

## This R script runs a variant calling pipeline using VarScan and further annotates the variants using ANNOVAR

## The program requires the following software to be installed:

## SAMTOOLS - http://samtools.sourceforge.net/
## VarScan - http://massgenomics.org/varscan
## ANNOVAR - http://annovar.openbioinformatics.org/en/latest/


## Pipeline overview
The program requires as input a bam file containing preprocessed and mapped reads from a human sample. Using the hg19 genome as reference, SAMtools mpileup command is run to obtain a summary of the coverage of the mapped reads.
<br />
SAMtools mpileup is run with the following parameters modified from the default:<br />	
	-A and -B which does not discard anomalous read pairs and disables the reporting of the base quality scores respectively<br />	
	-d9999 which sets the maximum depth at the specified value to limit memory cost<br />
	-q 30 skips alignments where the mapping quality is below the specified value<br />
	-Q 20 skips bases where the base quality is lower than the specified value<br />
 This output is then subsequently used as the input for VarScan which calls reports variant positions (SNPs and indels) in variant call format VCF.<br />
 This VCF file is then piped to ANNOVAR which generates an output tab-delimited VCF file with additional annotation information. In order to run ANNOVAR, the program first downloads the hg19 refGene database files which are used for variant annotation, including the reference gene on which the variant is present as well as any amino acid changes associated with the variant.