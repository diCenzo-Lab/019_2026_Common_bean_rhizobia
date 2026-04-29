# Use ANI with our own Rhizobium species type strain database to rename the isolates
mkdir 7_ANI/ # Make directory to hold ANI data
cd 7_ANI/ # Move into folder
scp -r natalia@10.99.29.11:/workingdisk1/Natalia/Type_strain_taxonomy/02_Taxonomic_analyses/genomes/ . # Get type strains from other computer
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/029/194/105/GCF_029194105.1_ASM2919410v1/GCF_029194105.1_ASM2919410v1_genomic.fna.gz # Get the two new proposed type species
mv GCF_029194105.1_ASM2919410v1_genomic.fna.gz genomes/=Rhizobium_mulingense=__MC63_T.fna.gz # Get the two new proposed type species
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/028/994/275/GCF_028994275.1_ASM2899427v1/GCF_028994275.1_ASM2899427v1_genomic.fna.gz # Get the two new proposed type species
mv GCF_028994275.1_ASM2899427v1_genomic.fna.gz genomes/=Rhizobium_binxianense=__BJ04_T.fna.gz # Get the two new proposed type species
gunzip -r genomes # Unzip genomes
find genomes/*.fna > refList.txt # Get list of type strains
find ../5_Good_assemblies/*.fasta > queryList.txt # Get list of our isolates
fastANI --ql queryList.txt --rl refList.txt -o fastani.output.txt -t 16 # Run fastANI of our isolates versus the type strains
while IFS=$'\t' read -r strain_name
do
  grep -m 1 "$strain_name" fastani.output.txt >> fastani.top.txt
done < queryList.txt
sed -i 's/..\/5_Good_assemblies\///' fastani.top.txt # Simplify naming of isolates
sed -i s'/genomes\///' fastani.top.txt # Simplify naming of isolates
sed -i 's/.fasta//' fastani.top.txt # Simplify naming of isolates
sed -i 's/.fna//' fastani.top.txt # Simplify naming of isolates
cut -f1 fastani.top.txt | cut -f1,2 -d'_' > temp1.txt # Add columns of just the species names without strain names to the ANI file
cut -f2 fastani.top.txt | cut -f1,2 -d'_' > temp2.txt # Add columns of just the species names without strain names to the ANI file
paste fastani.top.txt temp1.txt temp2.txt > temp3.txt # Add columns of just the species names without strain names to the ANI file
mv temp3.txt fastani.top.txt # Add columns of just the species names without strain names to the ANI file
rm temp1.txt temp2.txt # Add columns of just the species names without strain names to the ANI file
get_misnamed_genomes.pl fastani.top.txt # Extract names of genomes to rename
sed -i 's/=//g' genomes_to_rename.txt # Remove the equal signs that were used to indicate the strain is not yet validated
cd ../ # Change directory
rename_misnamed_genomes.pl 7_ANI/genomes_to_rename.txt # Fix the names of the genomes to be renamed

# Since annotation already completed, and the above code was meant for renaming prior to annotation, update the annotation files and the metadata file
cd 6_PGAP_annotations/ # Change into the annotation directory
gunzip -r Rhizobium_leguminosarum_QUR0024 # Unzip the files in the relevant folders
gunzip -r Rhizobium_leguminosarum_QUR0049
gunzip -r Rhizobium_leguminosarum_QUR0061
gunzip -r Rhizobium_leguminosarum_QUR0064
gunzip -r Rhizobium_leguminosarum_QUR0065
gunzip -r Rhizobium_leguminosarum_QUR0068
gunzip -r Rhizobium_leguminosarum_QUR0098
gunzip -r Rhizobium_leguminosarum_QUR0099
gunzip -r Rhizobium_leguminosarum_QUR0100
gunzip -r Rhizobium_leguminosarum_QUR0101
gunzip -r Rhizobium_leguminosarum_QUR0102
gunzip -r Rhizobium_leguminosarum_QUR0128
gunzip -r Rhizobium_leguminosarum_QUR0135
gunzip -r Rhizobium_leguminosarum_QUR0140
gunzip -r Rhizobium_leguminosarum_QUR0141
gunzip -r Rhizobium_leguminosarum_QUR0142
gunzip -r Rhizobium_leguminosarum_QUR0143
gunzip -r Rhizobium_leguminosarum_QUR0144
gunzip -r Rhizobium_leguminosarum_QUR0145
gunzip -r Rhizobium_leguminosarum_QUR0170
gunzip -r Rhizobium_leguminosarum_QUR0175
gunzip -r Rhizobium_leguminosarum_QUR0176
gunzip -r Rhizobium_leguminosarum_QUR0178
gunzip -r Rhizobium_leguminosarum_QUR0179
gunzip -r Rhizobium_leguminosarum_QUR0180
gunzip -r Rhizobium_leguminosarum_QUR0191
gunzip -r Rhizobium_leguminosarum_QUR0206
gunzip -r Rhizobium_leguminosarum_QUR0263
gunzip -r Rhizobium_leguminosarum_QUR0264
gunzip -r Rhizobium_loessense_QUR0056
gunzip -r Rhizobium_loessense_QUR0080
gunzip -r Rhizobium_loessense_QUR0164
gunzip -r Rhizobium_loessense_QUR0187
sed -i 's/leguminosarum/binxianense/g' Rhizobium_leguminosarum_QUR0024/* # Update species names in all annotation files
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0049/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0061/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0064/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0065/*
sed -i 's/leguminosarum/binxianense/g' Rhizobium_leguminosarum_QUR0068/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0098/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0099/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0100/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0101/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0102/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0128/*
sed -i 's/leguminosarum/binxianense/g' Rhizobium_leguminosarum_QUR0135/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0140/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0141/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0142/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0143/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0144/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0145/*
sed -i 's/leguminosarum/binxianense/g' Rhizobium_leguminosarum_QUR0170/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0175/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0176/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0178/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0179/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0180/*
sed -i 's/leguminosarum/binxianense/g' Rhizobium_leguminosarum_QUR0191/*
sed -i 's/leguminosarum/binxianense/g' Rhizobium_leguminosarum_QUR0206/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0263/*
sed -i 's/leguminosarum/johnstonii/g' Rhizobium_leguminosarum_QUR0264/*
sed -i 's/loessense/mongolense/g' Rhizobium_loessense_QUR0056/*
sed -i 's/loessense/mongolense/g' Rhizobium_loessense_QUR0080/*
sed -i 's/loessense/mongolense/g' Rhizobium_loessense_QUR0164/*
sed -i 's/loessense/mongolense/g' Rhizobium_loessense_QUR0187/*
pigz -p 16 -r Rhizobium_leguminosarum_QUR0024 # Rezip the files in the relevant folders
pigz -p 16 -r Rhizobium_leguminosarum_QUR0049
pigz -p 16 -r Rhizobium_leguminosarum_QUR0061
pigz -p 16 -r Rhizobium_leguminosarum_QUR0064
pigz -p 16 -r Rhizobium_leguminosarum_QUR0065
pigz -p 16 -r Rhizobium_leguminosarum_QUR0068
pigz -p 16 -r Rhizobium_leguminosarum_QUR0098
pigz -p 16 -r Rhizobium_leguminosarum_QUR0099
pigz -p 16 -r Rhizobium_leguminosarum_QUR0100
pigz -p 16 -r Rhizobium_leguminosarum_QUR0101
pigz -p 16 -r Rhizobium_leguminosarum_QUR0102
pigz -p 16 -r Rhizobium_leguminosarum_QUR0128
pigz -p 16 -r Rhizobium_leguminosarum_QUR0135
pigz -p 16 -r Rhizobium_leguminosarum_QUR0140
pigz -p 16 -r Rhizobium_leguminosarum_QUR0141
pigz -p 16 -r Rhizobium_leguminosarum_QUR0142
pigz -p 16 -r Rhizobium_leguminosarum_QUR0143
pigz -p 16 -r Rhizobium_leguminosarum_QUR0144
pigz -p 16 -r Rhizobium_leguminosarum_QUR0145
pigz -p 16 -r Rhizobium_leguminosarum_QUR0170
pigz -p 16 -r Rhizobium_leguminosarum_QUR0175
pigz -p 16 -r Rhizobium_leguminosarum_QUR0176
pigz -p 16 -r Rhizobium_leguminosarum_QUR0178
pigz -p 16 -r Rhizobium_leguminosarum_QUR0179
pigz -p 16 -r Rhizobium_leguminosarum_QUR0180
pigz -p 16 -r Rhizobium_leguminosarum_QUR0191
pigz -p 16 -r Rhizobium_leguminosarum_QUR0206
pigz -p 16 -r Rhizobium_leguminosarum_QUR0263
pigz -p 16 -r Rhizobium_leguminosarum_QUR0264
pigz -p 16 -r Rhizobium_loessense_QUR0056
pigz -p 16 -r Rhizobium_loessense_QUR0080
pigz -p 16 -r Rhizobium_loessense_QUR0164
pigz -p 16 -r Rhizobium_loessense_QUR0187
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_binxianense/' Rhizobium_leguminosarum_QUR0024/* # Rename the annotation files
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0049/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0061/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0064/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0065/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_binxianense/' Rhizobium_leguminosarum_QUR0068/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0098/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0099/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0100/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0101/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0102/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0128/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_binxianense/' Rhizobium_leguminosarum_QUR0135/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0140/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0141/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0142/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0143/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0144/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0145/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_binxianense/' Rhizobium_leguminosarum_QUR0170/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0175/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0176/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0178/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0179/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0180/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_binxianense/' Rhizobium_leguminosarum_QUR0191/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_binxianense/' Rhizobium_leguminosarum_QUR0206/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0263/*
rename 's/\/Rhizobium_leguminosarum/\/Rhizobium_johnstonii/' Rhizobium_leguminosarum_QUR0264/*
rename 's/\/Rhizobium_loessense/\/Rhizobium_mongolense/' Rhizobium_loessense_QUR0056/*
rename 's/\/Rhizobium_loessense/\/Rhizobium_mongolense/' Rhizobium_loessense_QUR0080/*
rename 's/\/Rhizobium_loessense/\/Rhizobium_mongolense/' Rhizobium_loessense_QUR0164/*
rename 's/\/Rhizobium_loessense/\/Rhizobium_mongolense/' Rhizobium_loessense_QUR0187/*
rename 's/leguminosarum/binxianense/' Rhizobium_leguminosarum_QUR0024 # Rename the annotation folders
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0049
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0061
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0064
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0065
rename 's/leguminosarum/binxianense/' Rhizobium_leguminosarum_QUR0068
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0098
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0099
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0100
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0101
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0102
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0128
rename 's/leguminosarum/binxianense/' Rhizobium_leguminosarum_QUR0135
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0140
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0141
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0142
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0143
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0144
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0145
rename 's/leguminosarum/binxianense/' Rhizobium_leguminosarum_QUR0170
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0175
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0176
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0178
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0179
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0180
rename 's/leguminosarum/binxianense/' Rhizobium_leguminosarum_QUR0191
rename 's/leguminosarum/binxianense/' Rhizobium_leguminosarum_QUR0206
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0263
rename 's/leguminosarum/johnstonii/' Rhizobium_leguminosarum_QUR0264
rename 's/loessense/mongolense/' Rhizobium_loessense_QUR0056
rename 's/loessense/mongolense/' Rhizobium_loessense_QUR0080
rename 's/loessense/mongolense/' Rhizobium_loessense_QUR0164
rename 's/loessense/mongolense/' Rhizobium_loessense_QUR0187
cd .. # Change directory
sed -i 's/QUR0024\tRhizobium_leguminosarum/QUR0024\tRhizobium_binxianense/' metadata.txt # Fix names in metadata file
sed -i 's/QUR0049\tRhizobium_leguminosarum/QUR0049\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0061\tRhizobium_leguminosarum/QUR0061\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0064\tRhizobium_leguminosarum/QUR0064\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0065\tRhizobium_leguminosarum/QUR0065\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0068\tRhizobium_leguminosarum/QUR0068\tRhizobium_binxianense/' metadata.txt
sed -i 's/QUR0098\tRhizobium_leguminosarum/QUR0098\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0099\tRhizobium_leguminosarum/QUR0099\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0100\tRhizobium_leguminosarum/QUR0100\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0101\tRhizobium_leguminosarum/QUR0101\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0102\tRhizobium_leguminosarum/QUR0102\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0128\tRhizobium_leguminosarum/QUR0128\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0135\tRhizobium_leguminosarum/QUR0135\tRhizobium_binxianense/' metadata.txt
sed -i 's/QUR0140\tRhizobium_leguminosarum/QUR0140\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0141\tRhizobium_leguminosarum/QUR0141\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0142\tRhizobium_leguminosarum/QUR0142\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0143\tRhizobium_leguminosarum/QUR0143\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0144\tRhizobium_leguminosarum/QUR0144\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0145\tRhizobium_leguminosarum/QUR0145\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0170\tRhizobium_leguminosarum/QUR0170\tRhizobium_binxianense/' metadata.txt
sed -i 's/QUR0175\tRhizobium_leguminosarum/QUR0175\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0176\tRhizobium_leguminosarum/QUR0176\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0178\tRhizobium_leguminosarum/QUR0178\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0179\tRhizobium_leguminosarum/QUR0179\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0180\tRhizobium_leguminosarum/QUR0180\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0191\tRhizobium_leguminosarum/QUR0191\tRhizobium_binxianense/' metadata.txt
sed -i 's/QUR0206\tRhizobium_leguminosarum/QUR0206\tRhizobium_binxianense/' metadata.txt
sed -i 's/QUR0263\tRhizobium_leguminosarum/QUR0263\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0264\tRhizobium_leguminosarum/QUR0264\tRhizobium_johnstonii/' metadata.txt
sed -i 's/QUR0056\tRhizobium_loessense/QUR0056\tRhizobium_mongolense/' metadata.txt
sed -i 's/QUR0080\tRhizobium_loessense/QUR0080\tRhizobium_mongolense/' metadata.txt
sed -i 's/QUR0164\tRhizobium_loessense/QUR0164\tRhizobium_mongolense/' metadata.txt
sed -i 's/QUR0187\tRhizobium_loessense/QUR0187\tRhizobium_mongolense/' metadata.txt