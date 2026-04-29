# Make home assembly directory and switch into it
mkdir 2_Annotation/
cd 2_Annotation/

# Make template.yaml file
echo 'fasta:' > pgap.yaml
echo '    class: File' >> pgap.yaml
echo '    location: XXX.pgap.fasta' >> pgap.yaml
echo 'submol:' >> pgap.yaml
echo '    class: File' >> pgap.yaml
echo '    location: XXX.pgap.submol.yaml' >> pgap.yaml

# Make template.submol.yaml file
echo "organism:" > pgap.submol.yaml
echo "    genus_species: 'XXX'" >> pgap.submol.yaml
echo "    strain: 'YYY'" >> pgap.submol.yaml
echo "contact_info:" >> pgap.submol.yaml
echo "    last_name: 'diCenzo'" >> pgap.submol.yaml
echo "    first_name: 'George'" >> pgap.submol.yaml
echo "    email: 'george.dicenzo@queensu.ca'" >> pgap.submol.yaml
echo "    organization: 'Queens University'" >> pgap.submol.yaml
echo "    department: 'Department of Biology'" >> pgap.submol.yaml
echo "    street: '116 Barrie Street'" >> pgap.submol.yaml
echo "    city: 'Kingston'" >> pgap.submol.yaml
echo "    state: 'ON'" >> pgap.submol.yaml
echo "    postal_code: 'K7P0S7'" >> pgap.submol.yaml
echo "    country: 'Canada'" >> pgap.submol.yaml
echo "authors:" >> pgap.submol.yaml
echo "    - author:" >> pgap.submol.yaml
echo "        last_name: 'Esme'" >> pgap.submol.yaml
echo "        first_name: 'Oona'" >> pgap.submol.yaml
echo "    - author:" >> pgap.submol.yaml
echo "        last_name: 'Dixon'" >> pgap.submol.yaml
echo "        first_name: 'Avery'" >> pgap.submol.yaml
echo "        middle_initial: 'W'" >> pgap.submol.yaml
echo "    - author:" >> pgap.submol.yaml
echo "        last_name: 'Harrison'" >> pgap.submol.yaml
echo "        first_name: 'Tia'" >> pgap.submol.yaml
echo "        middle_initial: 'L'" >> pgap.submol.yaml
echo "    - author:" >> pgap.submol.yaml
echo "        last_name: 'diCenzo'" >> pgap.submol.yaml
echo "        first_name: 'George'" >> pgap.submol.yaml
echo "        middle_initial: 'C'" >> pgap.submol.yaml

# Run genome annotation
genome_annotation_batch.sh pgap.yaml pgap.submol.yaml /workingdisk1/George/9_BENEFIT_Microbes/Phaseolus_symbionts_2023/1_Assembly/ 16

# Fix assemblies with issues and re-run annotation
cd Rhizobium_croatiense_QUR0058/ # Change directory
grep '>' QUR0058.pgap.fasta | cut -f1 -d' ' | sed 's/>//' > contig.list.txt
pullseq -i QUR0058.pgap.fasta -n contig.list.txt -l 100000000 > QUR0058.pgap.reformatted.fasta
cat calls.tab # Find location of adapter sequence(s)
grep -n '>' QUR0058.pgap.reformatted.fasta # Find which line of the file has the contig(s) needing to be updated
head -16 QUR0058.pgap.reformatted.fasta | tail -1 | cut -c1695297-1697555 # Get the sequence of the adapter to be removed
sed -i 's/TGAAGCGGCGCACGAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACCAGGCTTCAGTAGTGTCATTGACACGGTTAAACACCCGGTTTTATAACTGAACAAGTAAAACGAACATGAACAAGTAACAAAAAAACCACGAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACCCTTGTCTGGAGGAAGACTGAGAAGGTTAAACATCCCAGTTTTTGATAAAAACTGAATGAGTGGGCTGCAGAAACATATGAAAATGTGATTATGTTTTCACTAAAATGGGAAACGGCCTCAAACCGTACCCTTATATTGGTTGTTGGTTTGACAAACCCAACGAGTAACTAGAAACAGAAACGTTGAACGAATAGGTATGATAAAAAAAAAAAACTTGGGGTGCCACACAAAAAAAAAACGAAATGCGAAAGCGTTTCACGATAAATGCGAAAACCTAGATGTTGAAAAGCTGCACCAGTGGTTATTGTTCAAAACCAACGAGTACATGCACACAAAAAAAACAAAAAAAAAACGTTTTTTTTTTGAACGAGTGTGTTGGCAGTGGGGAGTGCGTGTCCGAACGAGGCGACAGAAGCGCGACCGAAGGTGTCAAAAAAAATTGAATGCTTTGTTTTCGTGTGCGCGATGAAGAAGCAACGAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACTAGAGAACGGACAATGAGAGGCTCGGTTAATATCGGCTTCAAAACCGAACAAGTGCAGCAAAAAAGACGAAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACGTCGTGGGGAAGGACCCTTTCTACTGGGTTAATATCGAGTTTTTCAATAACCAATCCAGTAAAAAAAAAATTTTTAAAACGCGAAAGTGTTTCACGATAAAAATGGGAGGCAAACGTGCTGAGGCACTATAGTACTCCTCTGCCTTAATGGCCGATGGAACGAAGTAAGTCTAGAAGTAACATTTGAAGCGTGGCGCCGCCGATGATCGAATTGAGCGGCTGCGCGATGGACGTCGTCATAATAGGGAAGCGGGGGCGGAAACCGACCTTGAAATTTTTGGGCCATTGTTGATGACGCCGGCCACGGCCGGCCGACGAGTTCATATGCACATCGCGCATTCCTGCGAATAGGAACATCGGAGGGGCATTATCGCCGCCCACAGGTCCGCCGAATTTGAAGAGGCCTTCATCCTGCCACTTTCTTCAGGTTCCCCCAGTGGCGGATCGTCAGATCGTTGTTGAAGGTAAATTCCGCGTCCAGGCCGCCGAAGCCGTTTGCCTTGGTGGAGTAAGGCTTGTCGTGCAGGGCGTTGAGATTTTCGGTTTGCACCCACGATGAAGCGGCGCACGAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACCTTTGCATGAGACGGTCTGGATCTGGTTCAACATCCGGTTTTTCAAAACTGATCAAGCAAAGAAATTATTCGAAAAACGTGAAAGCGTTTCACGATACGTTGAAAACAGGTTTGGTATGTAGTTGTAAAATATCTGTGAAATTGTTTTGAAACTGAACGAAGTAGGCTCAAGAAACATAACCAAGTAATTTTTCAGTAAAATTTTTTTTTTTTTGAACGAGTGGTGTTGTGGAAGAAACAGTGACGAAAAAAAACGCGAAAGATGTTTCACGATAAATGCGAAATTTCATTATCGAACTTTAACTCTCCTCCGTTGGTTAAATACCGGTTTTTGACAACTGAACGAAGTAGTATACAAAACCCGGTCCTCAAGCCCGCTATTGAGGGCAATCTGTCGAGTTGAGGTACCGGGGCACCCGAGCCTTCCTTATGCAGGGACGGGATTCCTGGTGGGCGACAACCTGCTGATGACCAACCGCCACGTTGCGGAGATTTTTAGCTCTGGGCTCGGGCGCAAGAACATTTCCCTTATCCGTGATATGCAGAATGAAAGCGGCGCACGAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACGTCCAGGGTTGATGTCACTGAAGCGGCGCACGAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACAAGGTTACACAAACCCTGGACAAGGGTTAATATCGGCTTGCATAAACTGAACGAAGTACAGTACAATAAAACGAAAAACGCGAAAGCGTTTCACGATAAATGCGAAAACCTAGATGTTCAAAGCTGCACCAGTGGTTAACACCGGCCGCGTACTGAACGAGAGACCTGCAACAAGGCGATGAGGCGCT//' QUR0058.pgap.reformatted.fasta # Remove the adapter and split the contig
cd .. # Change back to working directory
cp Rhizobium_croatiense_QUR0058/QUR0058.pgap.reformatted.fasta QUR0058.pgap.fasta
rm -r Rhizobium_croatiense_QUR0058/
pgap.py --no-self-update --report-usage-false --no-internet -o Rhizobium_croatiense_QUR0058 -c 16 -m 100g QUR0058.pgap.yaml

# Clean up directory
mkdir 1_Input_files/
mv QUR* 1_Input_files/
pigz -p 32 -r *
