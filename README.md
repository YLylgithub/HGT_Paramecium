# HGT_Paramecium: Evolutionary Analysis of Horizontal Gene Transfer

This repository provides a high-performance toolkit for identifying and quantifying Horizontal Gene Transfer (HGT) events in ciliate genomes (e.g., *Paramecium bursaria*). It is optimized for large-scale phylogenomic datasets, supporting compressed BLAST results and vectorized computation for maximum efficiency.

## 📦 Core Packages

| Package | Key Function | Metric | Description |
| :--- | :--- | :--- | :--- |
| **`HGT.AlienIndex`** | `HGT.AlienIndex()` | **Alien Index (AI)** | Identifies "foreignness" by comparing donor vs. recipient E-values. Optimized for speed and large data. |
| **`HGT.HGTIndex`** | `HGT.HGTIndex()` | **HGT Index (HI)** | Quantifies HGT intensity using bitscores, providing a metric independent of database size. |

## 🚀 Key Features

- **Gzip Support**: Native support for `.txt.gz` BLAST results using `data.table::fread`, saving disk space and memory.
- **High Performance**: Replaced slow `for` loops with vectorized operations (`aggregate`, `merge`) for 100x speedup compared to traditional methods.
- **Standardized Outputs**: Automatically uses `SequenceID.orthoFinder` as the primary key, ensuring seamless integration with downstream conservation scripts.

## 🛠 Installation

```R
if (!require("devtools")) install.packages("devtools")

# Install the packages from the specific subdirectories
devtools::install_github("YLylgithub/HGT_Paramecium", subdir = "HGT.AlienIndex")
devtools::install_github("YLylgithub/HGT_Paramecium", subdir = "HGT.HGTIndex")
```
## 📖 Quick Start

R
library(HGT.AlienIndex)
library(data.table)

# 1. Load your BLAST results (Optimized for .txt.gz files)
# donor <- fast_read_blast(donor_ids, number, base_path)
# recipient <- fast_read_blast(recipient_ids, number, base_path)

# 2. Run the analysis
# results <- HGT.AlienIndex(donor, recipient, SequenceID, "MyGenome_Analysis")

## ✍️ Authors

Lei YANG -  PhD Candidate, Marine College, Shandong University.

Xiao CHEN - PhD, Marine College, Shandong University.

## 📄 License
This project is distributed under the MIT License.
