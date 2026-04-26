# HGT.HGTIndex 
### an R package to calculate HGT Index (HI) for genes in target species based on homolog search.

[![](https://img.shields.io/badge/release%20version-0.99.1-green.svg)](https://github.com/YLylgithub/HGT_Paramecium/HGT.HGTIndex/)
[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

‘HGT.HGTIndex’ calculates HGT Index (HI) for genes in target species from BLAST results between this species and donor/recipient species 

## :gear: Install HGT.HGTIndex in R

	if (!require("devtools")) install.packages("devtools")
	devtools::install_github("YLylgithub/HGT_Paramecium/HGT.HGTIndex")
	library(HGT.HGTIndex)

## :file_folder: Prepare input files

To acquire the homolog search result in the correct format, use parameter below: 

	# for BLAST
	-outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore
  
	# for diamond
	-outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore

## :bulb: Run HGT.HGTIndex

To calculate HGT Index for shared homologs in the target species with donor/recipient, use codes below to run examples: 

	# Read R documentation
	?HGT.HGTIndex
	
	# load input files
	test_donor <- read.table(gzfile(system.file("extdata", "test_0.txt.gz", package = "HGT.HGTIndex")), header=FALSE, sep="\t")
	test_recipient <- read.table(gzfile(system.file("extdata", "test_1.txt.gz", package = "HGT.HGTIndex")), header=FALSE, sep="\t")
	
	# Calculate HGT Index
	HGT.HGTIndex(test_donor, test_recipient, best.bitscore = TRUE)

HGT.HGTIndex will output a data frame containing the gene names and their corresponding HGT Indexes.

## :orange_book: What is HGT Index (HI)?

HGT Index takes as input the result of a BLASTp search of a whole set of predicted proteins of interest against the protein libraries of donor/recipient species. 
Two individual homolog searches are performed between protein sequences in the target species (as BLAST queries) and protein libraries of donor and recipient species, respectively. 
The blast results in tab-delimited format (12 columns) contain the best blast hit for each query. 

The HGT Index (HI) is computed with the following formula:

	HI = best_donor_bitscore - best_recipient_bitscore

Where the ***best donor bitscore*** is the bitscore from the best hit assigned to the taxonomic donor group; 
and ***best recipient bitscore*** is the bitscore from the best hit assigned to the taxonomic recipient group.

## :pencil2: Authors

Lei Yang, Ph.D. Candidate

Marine College, Shandong University, Weihai

<2534990076@qq.com>

Xiao Chen, PhD

Marine College, Shandong University, Weihai

<https://www.researchgate.net/profile/Xiao_Chen126>

If you use [HGT.HGTIndex](https://github.com/YLylgithub/HGT_Paramecium/HGT.HGTIndex/) in
published research, please cite the most appropriate paper(s) from this
list:

1.  **L Yang<sup>\*</sup>**, X Chen. *Manuscript in preparation*.

