##' 'HGT.AlienIndex' calculates Alien Index (AI) for genes in target species from BLAST results between this species and donor/recipient species. 
##'
##' The output by BLAST or diamond BLAST will be used as input of 'HGT.AlienIndex' and should be in a tabular format with 12 columns. 
##'
##' For BLAST, the output parameter should be: -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore'. 
##'
##' For diamond BLAST, the output parameter should be: -outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore. 
##'
##'
##' @title HGT.AlienIndex
##' @param blast_output_donor Input file with 12 columns in tab-delimited format
##' @param blast_output_recipient Input file with 12 columns in tab-delimited format
##' @return dataframe
##' @importFrom stats complete.cases
##' @export 
##' @author Xiao Chen
##' @references 1. X Chen, L Yang. Manuscript in preparation.
##' @examples
##' test_donor <- read.table(gzfile(system.file("extdata", "test_0.txt.gz", package = "HGT.AlienIndex")), header=FALSE, sep="\t")
##' test_recipient <- read.table(gzfile(system.file("extdata", "test_1.txt.gz", package = "HGT.AlienIndex")), header=FALSE, sep="\t")
##' HGT.AlienIndex(test_donor, test_recipient, best.evalue = TRUE)

## Main
HGT.AlienIndex <- function(blast_output_donor, 
                       blast_output_recipient,
                      best.evalue  =     TRUE
                   ) {

    donor <- blast_output_donor
    recipient <- blast_output_recipient
    colnames(donor) <- c("qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore")
    colnames(recipient) <- c("qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore")
    # shared genes between donors and recipients
    shared.genes = intersect(donor$qseqid, recipient$qseqid)

    # calculate AI for each shared homolog between donors and recipients
    if (length(shared.genes) > 0) {
        donor.shared = donor[donor$qseqid %in% shared.genes, c("qseqid", "evalue")]
        recipient.shared = recipient[recipient$qseqid %in% shared.genes, c("qseqid", "evalue")]
        min_donor = aggregate(evalue ~ qseqid, data = donor.shared, FUN = min)
        min_recipient = aggregate(evalue ~ qseqid, data = recipient.shared, FUN = min)
        AI.df = merge(min_donor, min_recipient, by = "qseqid")
        colnames(AI.df) = c("Sequence.name", "best_donor_evalue", "best_recipient_evalue")
        AI.df$AlienIndex = log(AI.df$best_recipient_evalue + 1e-200) - log(AI.df$best_donor_evalue + 1e-200)
        if (best.evalue == TRUE) {
            AI.df = AI.df[, c("Sequence.name", "AlienIndex", "best_donor_evalue", "best_recipient_evalue")]
        } else {
            AI.df = AI.df[, c("Sequence.name", "AlienIndex")]
        }
        AI.df = AI.df[order(-AI.df$AlienIndex), ]

    } else {
        message("No shared homologs between donors and recipients!")
        AI.df = data.frame()
    }
    return(AI.df)
	}