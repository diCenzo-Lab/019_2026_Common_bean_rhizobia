# Prepare directories for identifying and extracing NodC homologs
mkdir Input_files/ # Make directory
mkdir Genome_files/ # Make directory
mkdir hmmDatabaseFiles/ # Make directory
mkdir HMM_files/ # Make directory
mkdir HMMsearch/ # Make directory
mkdir HMMsearchParsed/ # Make directory
mkdir HMMsearchHits/ # Make directory
mkdir HMMscan/ # Make directory
mkdir HMMscanParsed/ # Make directory
mkdir HMMscanTop/ # Make directory
mkdir HMMscanTopLists/ # Make directory
mkdir SymbioticProteins/ # Make directory
mkdir Phylogenetic_analysis/ # Make directory

# Get genomes
ls -1 ../02_Phylogenomic_analysis/dRep_output/dereplicated_genomes/ | sed 's/.fasta//' > temp1.txt
find /workingdisk2/Upkar/2_Phaseolus_rhizobia/0_Phaseolus_rhizobia_genomes/genbank_updated/Rhizobium*.gbk.gz > temp2.txt
grep -f temp1.txt temp2.txt | sed 's/\/workingdisk2/cp \/workingdisk2/' | sed 's/.gbk.gz/.gbk.gz Genome_files\//' > temp3.sh
sh temp3.sh
rm temp1.txt temp2.txt temp3.sh
gunzip Genome_files/* # Unzip the files
rename 's/.gbk/.gbff/' Genome_files/*.gbk # Change the file extensions

# Create a file listing all of the genomes
ls -1 Genome_files/ | sed 's/.gbff//' > temp1.txt # Get the list of genomes
paste temp1.txt temp1.txt > Input_files/genomeList.txt # Make the desired file in the correct format
rm temp1.txt # Remove temporary file

# Extract all proteomes
perl Scripts/extractFaaFromGBFF.pl # Make faa files from the GenBank files
perl Scripts/modifyFasta.pl combined_proteomes_HMM.faa > combined_proteomes_HMM_modified.faa # Modify the fasta file for easy extraction

# Download HMM databases
wget http://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam37.0//Pfam-A.hmm.gz # get the Pfam HMM files
wget https://ftp.ncbi.nlm.nih.gov/hmm/TIGRFAMs/release_15.0/TIGRFAMs_15.0_HMM.LIB.gz # get the TIGRFAM HMM files
gunzip Pfam-A.hmm.gz # unzip the Pfam files
gunzip TIGRFAMs_15.0_HMM.LIB.gz # unzip the TIGRFAM files
mv Pfam-A.hmm hmmDatabaseFiles/Pfam-A.hmm # move the Pfam files
mv TIGRFAMs_15.0_HMM.LIB hmmDatabaseFiles/TIGRFAMs_15.0_HMM.LIB # move the TIGRFAM files
hmmconvert hmmDatabaseFiles/Pfam-A.hmm > hmmDatabaseFiles/Pfam-A_converted.hmm # convert the database to the necessary format
hmmconvert hmmDatabaseFiles/TIGRFAMs_15.0_HMM.LIB > hmmDatabaseFiles/TIGRFAM_converted.hmm # convert the database to the necessary format
cat hmmDatabaseFiles/Pfam-A_converted.hmm hmmDatabaseFiles/TIGRFAM_converted.hmm > hmmDatabaseFiles/converted_combined.hmm # combined all hidden Markov models into a single file
hmmpress hmmDatabaseFiles/converted_combined.hmm # prepare files for hmmscan searches

# Perform the HMMsearch screens
# Manually put the seed alignment files for all desired Pfam families in the folder HMM_files 
ls -1 HMM_files/ | sed 's/.txt//' > temp.txt # Get a list of HMMs; in this case, it is just NodC
mv temp.txt HMM_files/hmm_list.txt # Rename the files
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

# Phylogenetic analysis
# Manually downloaded all nodC sequences used by Efstathiadou et al (https://www.nature.com/articles/s41598-021-88051-8) and put in a file called nodC_Efstathiadou.fna within the input files folder
cat Input_files/nodC_Efstathiadou.fna | sed 's/_(/|/' | cut -f1 -d'|' | sed 's/sp./sp/' | sed 's/strain_//' | sed 's/bv./bv/' > Phylogenetic_analysis/nodC.combined.fna # Merge the nodC fasta files
cat SymbioticProteins/NodC.fna >> Phylogenetic_analysis/nodC.combined.fna # Merge the nodC fasta files
cd Phylogenetic_analysis/ # Change directory
mafft --thread 8 nodC.combined.fna > nodC.mafft.fna # Align the nodC sequences
trimal -in nodC.mafft.fna -out nodC.trimal.fna -fasta -automated1 # Trim the alignment
iqtree2 -s nodC.trimal.fna -m MF -T 4 --prefix nodC.model # Determine the best fit model and use it for the next step
best_model=$(grep 'Best-fit' nodC.model.log | cut -f3 -d' ')
echo $best_model #HKY+F+G4
iqtree2 -s nodC.trimal.fna -m $best_model --alrt 1000 -B 1000 -T 4 --prefix nodC.phylogeny
