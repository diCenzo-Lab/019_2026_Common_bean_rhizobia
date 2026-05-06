# Isolation of rhizobia from Ontario soils that are effective at fixing nitrogen with common bean (Phaseolus vulgaris)

Harrison TL, Pandher US, Dixon A, Esme O, Gagnon EMH, Naranjo-Robayo N, Doyle RT, Oresnik IJ, diCenzo GC. 2026 **Isolation of rhizobia from Ontario soils that are effective at fixing nitrogen with common bean (*Phaseolus vulgaris*)**. bioRxiv. doi: 10.64898/2026.05.01.722220.

This repository contains the scripts and input files required to repeat the analyses reported in the associated article.

## 01_Genome_assembly_and_annotation

This folder contains the overall workflows (four files) and the associated scripts  to repeat all steps of genome assembly, annotation, and taxonomic classification from the raw ONT reads.

## 02_Phylogenomic_analysis

This folder contains a script to repeat the phylogenomic analyses, including construction of a core genome phylogeny and calculation of average nucleotide identity.

## 03_NodC_analysis

This folder contains a script, as well as input files, to identify NodC in each proteome and construct a NodC phylogeny using a representative set of *Rhizobium* isolates.

## 04_NodC_analysis_full

This folder contains a script to identify nodC in each *Rhizobium* genome and to cluster them based on sequence identity.

## 05_Nod_locus

This folder contains a workflow (nod_locus_workflow.sh) and associated scripts to get the *nod* loci of a representative set of *Rhizobium* isolates.

## 06_Pangenome_analysis

This folder contains a script to calculate a pangenome from all *Rhizobium* isolates.

## 07_Stats_and_data_visualization

This folder contains the code and input files to perform all statistical analyses reported in this study, as well as figure creation. Files are organized into folders by experiment.