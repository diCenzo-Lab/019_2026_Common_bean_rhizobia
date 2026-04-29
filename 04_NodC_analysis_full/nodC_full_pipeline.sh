# Prepare directories for identifying and extracing NodC homologs
mkdir Input_files/ # Make directory
mkdir Genome_files/ # Make directory
mkdir hmmDatabaseFiles/ # Make directory
mkdir HMMsearch/ # Make directory
mkdir HMMsearchParsed/ # Make directory
mkdir HMMsearchHits/ # Make directory
mkdir HMMscan/ # Make directory
mkdir HMMscanParsed/ # Make directory
mkdir HMMscanTop/ # Make directory
mkdir HMMscanTopLists/ # Make directory
mkdir SymbioticProteins/ # Make directory

# Get genomes
cp /workingdisk2/Upkar/2_Phaseolus_rhizobia/0_Phaseolus_rhizobia_genomes/genbank_updated/Rhizobium_* Genome_files/
gunzip Genome_files/*
rename 's/.gbk/.gbff/' Genome_files/*.gbk

# Create a file listing all of the genomes
ls -1 Genome_files/ | sed 's/.gbff//' > temp1.txt # Get the list of genomes
paste temp1.txt temp1.txt > Input_files/genomeList.txt # Make the desired file in the correct format
rm temp1.txt # Remove temporary file

# Extract all proteomes
perl Scripts/extractFaaFromGBFF.pl # Make faa files from the GenBank files
perl Scripts/modifyFasta.pl combined_proteomes_HMM.faa > combined_proteomes_HMM_modified.faa # Modify the fasta file for easy extraction

# Get the HMM databases
cp -r ../03_NodC_analysis/hmmDatabaseFiles/ .

# Perform the HMMsearch screens
cp -r ../03_NodC_analysis/HMM_files/ .
rm HMM_files/NodC.hmm
perl Scripts/performHMMsearch.pl # A short script to repeat for all HMM files, the build, hmmsearch, parsing, and hit extraction

# Perform the HMMscan screens
perl Scripts/performHMMscan.pl # A short script to repeat for all the HMM search output files, to perform hmmscan, parse, and hit extraction

# Determine strains with each protein
perl Scripts/determineProteinPresence.pl > Symbiotic_gene_distribution.txt # determine which of the six proteins are in each of the strains

# Extract proteins
perl Scripts/extractHMMscanHits_Nod.pl # extract all the Nod proteins
sed -i 's/\t/\n/' SymbioticProteins/*_all.faa # fix format
rm SymbioticProteins/NodA_all.faa # Remove file since we didn't search for NodA
rm SymbioticProteins/NodB_all.faa # Remove file since we didn't search for NodB
mv SymbioticProteins/NodC_all.faa SymbioticProteins/NodC.fasta # Rename file

# Get the gene sequences
grep '>' SymbioticProteins/NodC.fasta | sed 's/__/;/g' | cut -f1,2 -d';' | sed 's/>//' | sed "s/;/\t/g" | grep 'QUR' > SymbioticProteins/NodC_names.txt # Get names of the nod genes and link to strain
cp /workingdisk2/Upkar/2_Phaseolus_rhizobia/0_Phaseolus_rhizobia_genomes/gene_fasta_updated/Rhizobium*.fna.gz Genome_files/ # Get the genome fasta files
gunzip Genome_files/* # Unzip the files
> SymbioticProteins/NodC_genes.fna # Create an empty file, or overwrite if it already exists
while IFS=$'\t' read -r strain_name gene_name # A loop to extract the nucleotide sequences of the nod genes
do
    grep $gene_name Genome_files/"$strain_name"_cds_from_genomic.fna | cut -f1 -d' ' | sed 's/>//' | pullseq -i Genome_files/"$strain_name"_cds_from_genomic.fna -N | sed "s/>lcl|/>"$strain_name"__/" | cut -f1,2,3 -d'_' >> SymbioticProteins/NodC_genes.fna
done < SymbioticProteins/NodC_names.txt
mv SymbioticProteins/NodC_genes.fna SymbioticProteins/NodC.fna # Rename file
mv SymbioticProteins/NodC.fasta SymbioticProteins/NodC.faa # Rename file

# Cluster the sequences to get symbiovar subclade assignments
cdhit -i SymbioticProteins/NodC.fna -o SymbioticProteins/NodC.cdhit -c 0.99 -d 0
