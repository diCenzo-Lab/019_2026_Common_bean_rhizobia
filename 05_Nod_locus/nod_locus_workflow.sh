# Get genomes
mkdir genomes/
ls -1 ../02_Phylogenomic_analysis/dRep_output/dereplicated_genomes/ | sed 's/.fasta//' > temp1.txt
find /workingdisk2/Upkar/2_Phaseolus_rhizobia/0_Phaseolus_rhizobia_genomes/gff_updated/Rhizobium*.gff.gz > temp2.txt
grep -f temp1.txt temp2.txt | sed 's/\/workingdisk2/cp \/workingdisk2/' | sed 's/.gff.gz/.gff.gz genomes\//' > temp3.sh
sh temp3.sh
rm temp1.txt temp2.txt temp3.sh
gunzip genomes/* # Unzip the files

# Get the genes of interest for everything but R mongolense
mkdir genomes_reversed/
mkdir wrapped_contigs/
> nod_loci.txt # Create an empty file, or overwrite if it already exists
perl get_locus_1.pl genomes/Rhizobium_anhuiense_QUR0074.gff >> nod_loci.txt
tac genomes/Rhizobium_croatiense_QUR0011.gff > genomes_reversed/Rhizobium_croatiense_QUR0011.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_croatiense_QUR0011.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_croatiense_QUR0087.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_croatiense_QUR0154.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_croatiense_QUR0156.gff >> nod_loci.txt
tac genomes/Rhizobium_croatiense_QUR0171.gff > genomes_reversed/Rhizobium_croatiense_QUR0171.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_croatiense_QUR0171.gff >> nod_loci.txt
tac genomes/Rhizobium_hidalgonense_QUR0172.gff > genomes_reversed/Rhizobium_hidalgonense_QUR0172.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_hidalgonense_QUR0172.gff >> nod_loci.txt
tac genomes/Rhizobium_johnstonii_QUR0098.gff > genomes_reversed/Rhizobium_johnstonii_QUR0098.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_johnstonii_QUR0098.gff >> nod_loci.txt
tac genomes/Rhizobium_laguerreae_QUR0112.gff > genomes_reversed/Rhizobium_laguerreae_QUR0112.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_laguerreae_QUR0112.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_leguminosarum_QUR0050.gff >> nod_loci.txt
tac genomes/Rhizobium_leguminosarum_QUR0062.gff > genomes_reversed/Rhizobium_leguminosarum_QUR0062.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_leguminosarum_QUR0062.gff >> nod_loci.txt
tac genomes/Rhizobium_leguminosarum_QUR0136.gff > genomes_reversed/Rhizobium_leguminosarum_QUR0136.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_leguminosarum_QUR0136.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_leguminosarum_QUR0177.gff >> nod_loci.txt
tac genomes/Rhizobium_leguminosarum_QUR0210.gff > genomes_reversed/Rhizobium_leguminosarum_QUR0210.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_leguminosarum_QUR0210.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_sophoriradicis_QUR0003.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_sp_QUR0071.gff >> nod_loci.txt
tac genomes/Rhizobium_sp_QUR0108.gff > genomes_reversed/Rhizobium_sp_QUR0108.gff
perl get_locus_1.pl genomes_reversed/Rhizobium_sp_QUR0108.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_sp_QUR0225.gff >> nod_loci.txt
tac genomes/Rhizobium_croatiense_QUR0168.gff > genomes_reversed/Rhizobium_croatiense_QUR0168.gff
grep 'contig_1' genomes_reversed/Rhizobium_croatiense_QUR0168.gff > wrapped_contigs/Rhizobium_croatiense_QUR0168.gff
grep 'contig_1' genomes_reversed/Rhizobium_croatiense_QUR0168.gff >> wrapped_contigs/Rhizobium_croatiense_QUR0168.gff
perl get_locus_1.pl wrapped_contigs/Rhizobium_croatiense_QUR0168.gff | head -n -1 >> nod_loci.txt
grep 'contig_1' genomes/Rhizobium_leguminosarum_QUR0186.gff > wrapped_contigs/Rhizobium_leguminosarum_QUR0186.gff
grep 'contig_1' genomes/Rhizobium_leguminosarum_QUR0186.gff >> wrapped_contigs/Rhizobium_leguminosarum_QUR0186.gff
perl get_locus_1.pl wrapped_contigs/Rhizobium_leguminosarum_QUR0186.gff | head -n -1 >> nod_loci.txt
tac genomes/Rhizobium_sp_QUR0188.gff > genomes_reversed/Rhizobium_sp_QUR0188.gff
grep 'contig_5' genomes_reversed/Rhizobium_sp_QUR0188.gff > wrapped_contigs/Rhizobium_sp_QUR0188.gff
grep 'contig_5' genomes_reversed/Rhizobium_sp_QUR0188.gff >> wrapped_contigs/Rhizobium_sp_QUR0188.gff
perl get_locus_1.pl wrapped_contigs/Rhizobium_sp_QUR0188.gff | head -n -1 >> nod_loci.txt
perl get_locus_2.pl genomes/Rhizobium_mongolense_QUR0164.gff >> nod_loci.txt
perl get_locus_1.pl genomes/Rhizobium_croatiense_QUR0161.gff