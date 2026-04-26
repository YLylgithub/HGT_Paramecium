##' 'HGT.HGTIndex' calculates HGT Index (HI) for genes in target species from BLAST results between this species and donor/recipient species. 
##'
##' The output by BLAST or diamond BLAST will be used as input of 'HGT.HGTIndex' and should be in a tabular format with 12 columns. 
##'
##' For BLAST, the output parameter should be: -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore'. 
##'
##' For diamond BLAST, the output parameter should be: -outfmt 6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore. 
##'
##'
##' @title HGT.HGTIndex
##' @param blast_output_donor Input file with 12 columns in tab-delimited format
##' @param blast_output_recipient Input file with 12 columns in tab-delimited format
##' @return dataframe
##' @importFrom stats complete.cases
##' @export 
##' @author Lei Yang
##' @references 1. L Yang, X Chen. Manuscript in preparation.
##' @examples
##' test_donor <- read.table(gzfile(system.file("extdata", "test_0.txt.gz", package = "HGT.HGTIndex")), header=FALSE, sep="\t")
##' test_recipient <- read.table(gzfile(system.file("extdata", "test_1.txt.gz", package = "HGT.HGTIndex")), header=FALSE, sep="\t")
##' HGT.HGTIndex(test_donor, test_recipient, best.bitscore = TRUE)

## Main
HGT.HGTIndex <- function(blast_output_donor, 
                       blast_output_recipient,
                      best.bitscore  =     TRUE
                   ) {

    donor <- blast_output_donor
    recipient <- blast_output_recipient
    colnames(donor) <- c("qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore")
    colnames(recipient) <- c("qseqid", "sseqid", "pident", "length", "mismatch", "gapopen", "qstart", "qend", "sstart", "send", "evalue", "bitscore")
    # shared genes between donors and recipients
    shared.genes = intersect(donor$qseqid, recipient$qseqid)

    # calculate HI for each shared homolog between donors and recipients
    if (length(shared.genes) > 0) {
        donor.shared = donor[donor$qseqid %in% shared.genes, c("qseqid", "bitscore")]
        recipient.shared = recipient[recipient$qseqid %in% shared.genes, c("qseqid", "bitscore")]
        max_donor = aggregate(bitscore ~ qseqid, data = donor.shared, FUN = max)
        max_recipient = aggregate(bitscore ~ qseqid, data = recipient.shared, FUN = max)
        HI.df = merge(max_donor, max_recipient, by = "qseqid")
        colnames(HI.df) = c("Sequence.name", "best_donor_bitscore", "best_recipient_bitscore")
        HI.df$HGTIndex = HI.df$best_donor_bitscore - HI.df$best_recipient_bitscore
        if (best.bitscore == TRUE) {
            HI.df = HI.df[, c("Sequence.name", "HGTIndex", "best_donor_bitscore", "best_recipient_bitscore")]
        } else {
            HI.df = HI.df[, c("Sequence.name", "HGTIndex")]
        }
        HI.df = HI.df[order(-HI.df$HGTIndex), ]

    } else {
        message("No shared homologs between donors and recipients!")
        HI.df = data.frame()
    }
    return(HI.df)
	}