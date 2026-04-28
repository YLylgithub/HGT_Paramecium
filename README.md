# HGT_Paramecium: Evolutionary Analysis of Horizontal Gene Transfer

This repository provides a high-performance toolkit for identifying and quantifying Horizontal Gene Transfer (HGT) events in ciliate genomes (e.g., *Paramecium bursaria*). It is optimized for large-scale phylogenomic datasets, supporting compressed BLAST results and vectorized computation for maximum efficiency.

## 📦 Core Packages

| Package | Key Function | Metric | Description |
| :--- | :--- | :--- | :--- |
| **`HGT.AlienIndex`** | `HGT.AlienIndex()` | **Alien Index (AI)** | Identifies "foreignness" by comparing donor vs. recipient E-values. Optimized for speed and large data. |
| **`HGT.HGTIndex`** | `HGT.HGTIndex()` | **HGT Index (HI)** | Quantifies HGT intensity using bitscores, providing a metric independent of database size. |

## ✍️ Authors

Lei Yang - PhD Candidate, Marine College, Shandong University.

Xiao Chen - PhD, Marine College, Shandong University.
