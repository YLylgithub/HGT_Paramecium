# HGT_Paramecium: Custom R Scripts for Identifying Candidate HTGs

This repository contains custom R scripts and packages developed for the genome-scale identification and validation of candidate Horizontal Gene Transfer (HTG) events.

## 📦 Core Packages

| Package | Key Function | Metric | Description |
| :--- | :--- | :--- | :--- |
| **`HGT.AlienIndex`** | `HGT.AlienIndex()` | **Alien Index (AI)** | Identifies "foreignness" by comparing donor vs. recipient E-values. Optimized for speed and large data. |
| **`HGT.HGTIndex`** | `HGT.HGTIndex()` | **HGT Index (HI)** | Quantifies HGT intensity using bitscores, providing a metric independent of database size. |

## ✍️ Authors

Lei Yang - PhD Candidate, Marine College, Shandong University.

Xiao Chen - PhD, Marine College, Shandong University.

## 📄 Data Availability

All custom code used for HGT identification in our study is available in this repository. If you utilize these tools or methodologies in your research, please cite our corresponding manuscript.
