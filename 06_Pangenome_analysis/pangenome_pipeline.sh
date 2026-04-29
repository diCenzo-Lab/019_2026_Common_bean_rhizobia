# Get the genome files
cp -r /workingdisk2/Upkar/2_Phaseolus_rhizobia/0_Phaseolus_rhizobia_genomes/genbank_updated/ Genome_files/
gunzip Genome_files/*

# Activate the panaroo environment
conda activate panaroo

# Run panaroo for Rhizobium anhuiense
find Genome_files/Rhizobium_anhuiense*.gbk > Rhizobium_anhuiense.txt
panaroo -i Rhizobium_anhuiense.txt -o Rhizobium_anhuiense -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium binxianense
find Genome_files/Rhizobium_binxianense*.gbk > Rhizobium_binxianense.txt
panaroo -i Rhizobium_binxianense.txt -o Rhizobium_binxianense -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium croatiense
find Genome_files/Rhizobium_croatiense*.gbk > Rhizobium_croatiense.txt
panaroo -i Rhizobium_croatiense.txt -o Rhizobium_croatiense -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium hidalgonense
find Genome_files/Rhizobium_hidalgonense*.gbk > Rhizobium_hidalgonense.txt
panaroo -i Rhizobium_hidalgonense.txt -o Rhizobium_hidalgonense -c 0.90 -t 16 --clean-mode sensitive --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium johnstonii
find Genome_files/Rhizobium_johnstonii*.gbk > Rhizobium_johnstonii.txt
panaroo -i Rhizobium_johnstonii.txt -o Rhizobium_johnstonii -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium laguerreae
find Genome_files/Rhizobium_laguerreae*.gbk > Rhizobium_laguerreae.txt
panaroo -i Rhizobium_laguerreae.txt -o Rhizobium_laguerreae -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium leguminosarum
find Genome_files/Rhizobium_leguminosarum*.gbk > Rhizobium_leguminosarum.txt
panaroo -i Rhizobium_leguminosarum.txt -o Rhizobium_leguminosarum -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium mongolense
find Genome_files/Rhizobium_mongolense*.gbk > Rhizobium_mongolense.txt
panaroo -i Rhizobium_mongolense.txt -o Rhizobium_mongolense -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium sophoriradicis
find Genome_files/Rhizobium_sophoriradicis*.gbk > Rhizobium_sophoriradicis.txt
panaroo -i Rhizobium_sophoriradicis.txt -o Rhizobium_sophoriradicis -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium spA
find Genome_files/Rhizobium_sp*.gbk | grep -v 'QUR0225' | grep -v 'QUR0188' | grep -v 'QUR0107' | grep -v 'QUR0047' | grep -v 'QUR0044' > Rhizobium_spA.txt
panaroo -i Rhizobium_spA.txt -o Rhizobium_spA -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Run panaroo for Rhizobium spB
find Genome_files/Rhizobium_sp*.gbk | grep -v -f Rhizobium_spA.txt > Rhizobium_spB.txt
panaroo -i Rhizobium_spB.txt -o Rhizobium_spB -c 0.90 -t 16 --clean-mode strict --no_clean_edges --remove-invalid-genes

# Merge the pangenomes
panaroo-merge -d Rhizobium_anhuiense/ Rhizobium_binxianense/ Rhizobium_croatiense/ Rhizobium_hidalgonense/ Rhizobium_johnstonii/ Rhizobium_laguerreae/ Rhizobium_leguminosarum/ Rhizobium_mongolense/ Rhizobium_sophoriradicis/ Rhizobium_spA/ Rhizobium_spB/ -o 01_Rhizobium_pangenome -c 0.70 -f 0.5 --len_dif_percent 0.8 -t 16 # Try without merging paralogs
panaroo-merge -d Rhizobium_anhuiense/ Rhizobium_binxianense/ Rhizobium_croatiense/ Rhizobium_hidalgonense/ Rhizobium_johnstonii/ Rhizobium_laguerreae/ Rhizobium_leguminosarum/ Rhizobium_mongolense/ Rhizobium_sophoriradicis/ Rhizobium_spA/ Rhizobium_spB/ -o 02_Rhizobium_pangenome -c 0.70 -f 0.5 --len_dif_percent 0.8 -t 16 --merge_paralogs # And now try with merging paralogs

