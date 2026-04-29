#!/bin/bash

# Inputs are:
# $1 - tab delimited file with strain name (column 1) and file name (column 2)
# $2 - full path of the folder holding the nanopore data
# $3 - number of threads to use for all steps
# $4 - estimated genome size
# $5 - coverage for disjointing assembly
# $6 - minimum contig size to keep

# Run Flye and medaka for each of the samples
mkdir 1_Working_assemblies/ # Make directory to hold all intermediate assembly data
mkdir 2_Draft_assemblies/ # Make directory to hold polished assemblies
while IFS=$'\t' read -r strain_name file_name
do
  flye --nano-hq "$2/$file_name" -o "1_Working_assemblies/$strain_name" -t $3 -m 1000 --genome-size $4 --asm-coverage $5 # Run Flye
  medaka_consensus -i "$2/$file_name" -d "1_Working_assemblies/$strain_name/assembly.fasta" -o "1_Working_assemblies/$strain_name/medaka_polishing" -t $3 -m r1041_e82_400bps_sup_v4.2.0 # Run medaka
  cp "1_Working_assemblies/$strain_name/medaka_polishing/consensus.fasta" "1_Working_assemblies/$strain_name/$strain_name.fasta" # Put polished assembly in main strain assembly folder
  cat "1_Working_assemblies/$strain_name/assembly_info.txt" | awk -F " " '{if ($2>='"$6"') print $1}' | grep -v 'seq_name' > "1_Working_assemblies/$strain_name/long_contigs.txt" # Get list of contigs of atleast 5000 bp
  pullseq -i "1_Working_assemblies/$strain_name/$strain_name.fasta" -n "1_Working_assemblies/$strain_name/long_contigs.txt" > "2_Draft_assemblies/$strain_name.fasta"
  pigz -p 16 -r "1_Working_assemblies/$strain_name"
done < "$1"
gunzip 1_Working_assemblies/*/assembly_info.txt.gz # Unzip the assembly_info.txt files as they may be needed later

# Run GTDB-tk and CheckM
mkdir 3_GTDB-tk_output/ # Make directory to hold the GTDB-tk classifications
mkdir 4_CheckM_output/ # Make directory to hold the CheckM QC data
gtdbtk classify_wf --genome_dir 2_Draft_assemblies/ --out_dir 3_GTDB-tk_output/ --cpus $3 --mash_db /home/Bioinformatics_programs/GTDB-tk/gtdb.mash.msh --extension fasta # Run GTDB-tk
checkm lineage_wf -t $3 -x fasta -f checkm_output.txt 2_Draft_assemblies/ 4_CheckM_output/
mv checkm_output.txt 4_CheckM_output

# Get just the good assemblies and rename based on taxonomy
mkdir 5_Good_assemblies/ # Make directory for assemblies that pass QC
cp 4_CheckM_output/checkm_output.txt 4_CheckM_output/checkm_output_2.txt
sed -i 's/  / /g' 4_CheckM_output/checkm_output_2.txt
sed -i 's/  / /g' 4_CheckM_output/checkm_output_2.txt
sed -i 's/  / /g' 4_CheckM_output/checkm_output_2.txt
sed -i 's/  / /g' 4_CheckM_output/checkm_output_2.txt
sed -i 's/  / /g' 4_CheckM_output/checkm_output_2.txt
get_good_assemblies.pl # Collect the good assemblies and rename them

