#' BLAST output
#'
#' A dataset containing homolog search results between the target species and recipient species, output by BLAST.
#'
#' @format data frames with 12 variables:
#' \describe{
#'   \item{qseqid}{query sequence ID}
#'   \item{sseqid}{subject sequence ID}
#'   \item{pident}{sequence alignment identity}
#'   \item{length}{sequence alignment length}
#'   \item{mismatch}{sequence alignment mismatch numbers}
#'   \item{gapopen}{gap size within sequence alignment}
#'   \item{qstart}{start location of alignment on query sequence}
#'   \item{qend}{end location of alignment on query sequence}
#'   \item{sstart}{start location of alignment on subject sequence}
#'   \item{send}{end location of alignment on subject sequence}
#'   \item{evalue}{sequence alignment E-value}
#'   \item{bitscore}{sequence alignment Bitscore}
#' }
#' @source \url{http://www.diamondse.info/}
"test_1"
