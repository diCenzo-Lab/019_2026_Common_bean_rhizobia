# Run dRep
dRep dereplicate dRep_output/ -g ../01_Genome_assembly_and_annotation/5_Good_assemblies/Rhizobium*.fasta -p 16 --ignoreGenomeQuality --S_algorithm fastANI -pa 0.95 -sa 0.998

# Collect the genomes for the phylogeny
mkdir genomes # make a directory to hold the genome information
cp dRep_output/dereplicated_genomes/*.fasta genomes/ # Get our dereplicated isolates
cp ../../Novel_rhizobium_species/all_genomes/* . # Get the type strains from the location we already have them downloaded
rm *_sp__* # Remove unwanted strains
rm Rhizobium_tubonense__CCBAU_85046_T.fna # Remove unwanted strains
rm Rhizobium_tumorigenes__1078_T.fna # Remove unwanted strains
rm Rhizobium_rhododendri__rho-6-2_T.fna # Remove unwanted strains
rm Rhizobium_rhizogenes__LMG150_T.fna # Remove unwanted strains
rm "=Rhizobium_cerradonense=__CNPSo_3464_T.fna" # Remove unwanted strains
rm Rhizobium_leucaenae__USDA_9039_T.fna # Remove unwanted strains
rm Rhizobium_jaguaris__CCGE525_T.fna # Remove unwanted strains
rm Rhizobium_mayense__CCGE526_T.fna # Remove unwanted strains
rm Rhizobium_calliandrae__CCGE524_T.fna # Remove unwanted strains
rm Rhizobium_miluonense__HAMBI_2971_T.fna # Remove unwanted strains
rm Rhizobium_freirei__PRF_81_T.fna # Remove unwanted strains
rm "=Rhizobium_aureum=__CNPSo_3968_T.fna" # Remove unwanted strains
rm Rhizobium_multihospitium__HAMBI_2975_T.fna # Remove unwanted strains
rm Rhizobium_hainanense__CCBAU_57015_T.fna # Remove unwanted strains
rm "=Rhizobium_pantanalense=__CNPSo_4039_T.fna" # Remove unwanted strains
rm Rhizobium_dioscoreae__S-93_T.fna # Remove unwanted strains
rm "=Rhizobium_centroccidentale=__CNPSo_4062_T.fna" # Remove unwanted strains
rm "=Oryzifoliimicrobium_ureilyticus=__SG148__T.fna" # Remove unwanted strains
rm Rhizobium_aegyptiacum__1010_T.fna # Remove unwanted strains
rename "s/=//g" * # Fix naming
mv Rhizobium_paranaense__LMG_27577_T.fna Martinezella_paranaensis__LMG_27577_T.fna # Fix naming
mv Rhizobium_lusitanum__P1-7_T.fna Martinezella_lusitana__P1-7_T.fna # Fix naming
mv Rhizobium_tropici__CIAT_899_T.fna Martinezella_tropici__CIAT_899_T.fna # Fix naming
rename 's/.fna/.fasta/' * # Fix naming
mv Rhizobium* genomes/ # Put the genomes in the genomes directory
mv Martinezella_* genomes/ # Put the genomes in the genomes directory
rename 's/_QUR/__QUR/' genomes/* # Fix naming

# Calculate cpAAI and construct a core-proteome ML phylogeny
# The taxonomy pipeline of Naranjo-Robayo et al (2026) must first be downloaded from GitHub (https://github.com/diCenzo-Lab/017_2025_Rhizobiaceae_taxonomy/tree/main/Taxonomy_pipeline) and added to your path
export PATH="/workingdisk1/Natalia/ncbi-blast-2.17.0+/bin":$PATH # Set blast to a newer version of blast
taxonomic_assignment.sh -g /workingdisk1/Natalia/George/Common_bean_symbionts/genomes/ -x fasta -d /home/Bioinformatics_programs/taxonomy_pipeline/data/ -a Rhizobiaceae -t 16 -i 16 -r YES # this command should properly run the pipeline to create a phylogeny of the strains and to calculate the core proteome average amino acid identity (cpAAI) matrix

# Calculate ANI from the full set of 216 isolates, and excluding type strains
mkdir ANI/ # Make a folder for the ANI data
mkdir ANI/genomes_all/ # Make directory to hold the genomes
cp /datadisk1/Users/George/Projects/Phaseolus_symbionts_2023/5_Good_assemblies/Rhizobium*.fasta ANI/genomes_all/ # Get all the genomes
find ANI/genomes_all/*.fasta > ANI/ani.file_paths.txt # Get the list of input files
fastANI --ql ANI/ani.file_paths.txt --rl ANI/ani.file_paths.txt -o ANI/fastani_output.txt -t 16 # Calculate ANI values
sort -k1,1 -k2,2 ANI/fastani_output.txt > ANI/fastani_output_sorted_1.txt # Sort the file by first column then by second column
sort -k2,2 -k1,1 ANI/fastani_output.txt > ANI/fastani_output_sorted_2.txt # Sort the file by second column then by first column
cut -f 1,2,3 ANI/fastani_output_sorted_1.txt > temp1.txt # Get the relevant columns of the first sorted file
cut -f 3 ANI/fastani_output_sorted_2.txt > temp2.txt # Get the relevant columns of the second sorted file
paste -d ' ' temp1.txt temp2.txt > ANI/fastani_output_twoWay.txt # Combine the relevant columns
rm temp1.txt temp2.txt # remove the temporary files
prepareANImatrix.pl ANI/fastani_output_twoWay.txt ANI/ani.file_paths.txt > ANI/ANI.matrix.txt # make a two-way ANI matrix from the fastANI output
sed -i "s/genomes\///g" ANI/ANI.matrix.txt # fix naming in the file
sed -i "s/.fna//g" ANI/ANI.matrix.txt # fix naming in the file
cp ANI/ANI.matrix.txt Output_files/ANI_matrix.txt # copy file to output folder




