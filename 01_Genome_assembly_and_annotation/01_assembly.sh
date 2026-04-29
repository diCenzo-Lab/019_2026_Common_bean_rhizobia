# Make home assembly directory and switch into it
mkdir 1_Assembly/
cd 1_Assembly/

# Make directories to temporarily hold sequencing data
mkdir basecalled_data/
mkdir QUR0013-0092/
mkdir QUR0093-0172_with_ampure/
mkdir QUR0093-0172_with_kit_beads/
mkdir Rhizobia_Bean_gDNA/
mkdir Rhizobia_gDNA_reseq/

# Copy files to the sequencing data folders
cp ../../old/QUR0013-0092/basecalled_data/*.fastq.gz QUR0013-0092/
cp ../../old/QUR0093-0172_with_ampure/basecalled_data/*.fastq.gz QUR0093-0172_with_ampure/
cp ../../old/QUR0093-0172_with_kit_beads/basecalled_data/*.fastq.gz QUR0093-0172_with_kit_beads/
cp ../../old/Rhizobia_Bean_gDNA/basecalled_data/*.fastq.gz Rhizobia_Bean_gDNA/
cp ../../old/Rhizobia_gDNA_reseq/basecalled_data/*.fastq.gz Rhizobia_gDNA_reseq/

# Combine the fastq files when strains were sequenced more than once, or otherwise just copy the file
cat QUR0013-0092/SQK-RBK114-96_barcode10.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode02.fastq.gz Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode31.fastq.gz > basecalled_data/QUR0026.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode59.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode27.fastq.gz Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode23.fastq.gz > basecalled_data/QUR0044.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode78.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode61.fastq.gz Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode39.fastq.gz > basecalled_data/QUR0082.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode01.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode25.fastq.gz > basecalled_data/QUR0013.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode02.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode89.fastq.gz > basecalled_data/QUR0025.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode03.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode90.fastq.gz > basecalled_data/QUR0037.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode11.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode03.fastq.gz > basecalled_data/QUR0038.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode12.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode59.fastq.gz > basecalled_data/QUR0050.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode15.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode77.fastq.gz > basecalled_data/QUR0086.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode17.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode33.fastq.gz > basecalled_data/QUR0015.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode18.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode10.fastq.gz > basecalled_data/QUR0027.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode20.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode67.fastq.gz > basecalled_data/QUR0051.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode22.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode05.fastq.gz > basecalled_data/QUR0075.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode23.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode85.fastq.gz > basecalled_data/QUR0087.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode25.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode41.fastq.gz > basecalled_data/QUR0016.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode26.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode18.fastq.gz > basecalled_data/QUR0028.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode27.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode11.fastq.gz > basecalled_data/QUR0040.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode29.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode36.fastq.gz > basecalled_data/QUR0064.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode30.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode13.fastq.gz > basecalled_data/QUR0076.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode31.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode93.fastq.gz > basecalled_data/QUR0088.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode33.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode49.fastq.gz > basecalled_data/QUR0017.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode34.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode26.fastq.gz > basecalled_data/QUR0029.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode36.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode75.fastq.gz > basecalled_data/QUR0053.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode37.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode44.fastq.gz > basecalled_data/QUR0065.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode38.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode21.fastq.gz > basecalled_data/QUR0077.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode39.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode06.fastq.gz > basecalled_data/QUR0089.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode42.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode34.fastq.gz > basecalled_data/QUR0030.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode45.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode52.fastq.gz > basecalled_data/QUR0066.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode46.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode29.fastq.gz > basecalled_data/QUR0078.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode49.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode57.fastq.gz > basecalled_data/QUR0019.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode50.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode42.fastq.gz > basecalled_data/QUR0031.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode51.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode19.fastq.gz > basecalled_data/QUR0043.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode52.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode83.fastq.gz > basecalled_data/QUR0055.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode53.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode60.fastq.gz > basecalled_data/QUR0067.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode54.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode37.fastq.gz > basecalled_data/QUR0079.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode58.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode50.fastq.gz > basecalled_data/QUR0032.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode60.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode91.fastq.gz > basecalled_data/QUR0056.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode61.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode68.fastq.gz > basecalled_data/QUR0068.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode62.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode45.fastq.gz > basecalled_data/QUR0080.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode66.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode58.fastq.gz > basecalled_data/QUR0033.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode68.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode04.fastq.gz > basecalled_data/QUR0057.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode69.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode76.fastq.gz > basecalled_data/QUR0069.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode70.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode53.fastq.gz > basecalled_data/QUR0081.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode73.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode65.fastq.gz > basecalled_data/QUR0022.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode74.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode66.fastq.gz > basecalled_data/QUR0034.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode75.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode35.fastq.gz > basecalled_data/QUR0046.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode76.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode12.fastq.gz > basecalled_data/QUR0058.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode81.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode73.fastq.gz > basecalled_data/QUR0023.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode82.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode74.fastq.gz > basecalled_data/QUR0035.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode83.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode43.fastq.gz > basecalled_data/QUR0047.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode84.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode20.fastq.gz > basecalled_data/QUR0059.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode85.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode84.fastq.gz > basecalled_data/QUR0071.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode89.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode81.fastq.gz > basecalled_data/QUR0024.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode90.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode82.fastq.gz > basecalled_data/QUR0036.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode91.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode51.fastq.gz > basecalled_data/QUR0048.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode92.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode28.fastq.gz > basecalled_data/QUR0060.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode93.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode92.fastq.gz > basecalled_data/QUR0072.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode94.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode69.fastq.gz > basecalled_data/QUR0084.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode19.fastq.gz Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode94.fastq.gz > basecalled_data/QUR0039.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode35.fastq.gz Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode15.fastq.gz > basecalled_data/QUR0041.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode67.fastq.gz Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode07.fastq.gz > basecalled_data/QUR0045.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode86.fastq.gz Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode86.fastq.gz > basecalled_data/QUR0083.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode04.fastq.gz > basecalled_data/QUR0049.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode05.fastq.gz > basecalled_data/QUR0061.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode06.fastq.gz > basecalled_data/QUR0073.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode07.fastq.gz > basecalled_data/QUR0085.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode09.fastq.gz > basecalled_data/QUR0014.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode13.fastq.gz > basecalled_data/QUR0062.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode14.fastq.gz > basecalled_data/QUR0074.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode21.fastq.gz > basecalled_data/QUR0063.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode28.fastq.gz > basecalled_data/QUR0052.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode41.fastq.gz > basecalled_data/QUR0018.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode43.fastq.gz > basecalled_data/QUR0042.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode44.fastq.gz > basecalled_data/QUR0054.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode47.fastq.gz > basecalled_data/QUR0090.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode55.fastq.gz > basecalled_data/QUR0091.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode57.fastq.gz > basecalled_data/QUR0020.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode63.fastq.gz > basecalled_data/QUR0092.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode65.fastq.gz > basecalled_data/QUR0021.fastq.gz
cat QUR0013-0092/SQK-RBK114-96_barcode77.fastq.gz > basecalled_data/QUR0070.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode01.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode01.fastq.gz > basecalled_data/QUR0097.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode02.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode02.fastq.gz > basecalled_data/QUR0109.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode03.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode03.fastq.gz > basecalled_data/QUR0121.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode04.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode04.fastq.gz > basecalled_data/QUR0133.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode05.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode05.fastq.gz > basecalled_data/QUR0145.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode06.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode06.fastq.gz > basecalled_data/QUR0157.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode07.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode07.fastq.gz > basecalled_data/QUR0169.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode09.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode09.fastq.gz > basecalled_data/QUR0098.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode10.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode10.fastq.gz > basecalled_data/QUR0110.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode11.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode11.fastq.gz > basecalled_data/QUR0122.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode12.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode12.fastq.gz > basecalled_data/QUR0134.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode13.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode13.fastq.gz > basecalled_data/QUR0146.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode14.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode14.fastq.gz > basecalled_data/QUR0158.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode15.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode15.fastq.gz > basecalled_data/QUR0170.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode17.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode17.fastq.gz > basecalled_data/QUR0099.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode18.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode18.fastq.gz > basecalled_data/QUR0111.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode19.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode19.fastq.gz > basecalled_data/QUR0123.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode20.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode20.fastq.gz > basecalled_data/QUR0135.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode21.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode21.fastq.gz > basecalled_data/QUR0147.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode22.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode22.fastq.gz > basecalled_data/QUR0159.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode23.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode23.fastq.gz > basecalled_data/QUR0171.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode25.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode25.fastq.gz > basecalled_data/QUR0100.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode26.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode26.fastq.gz > basecalled_data/QUR0112.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode27.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode27.fastq.gz > basecalled_data/QUR0124.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode28.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode28.fastq.gz > basecalled_data/QUR0136.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode29.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode29.fastq.gz > basecalled_data/QUR0148.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode30.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode30.fastq.gz > basecalled_data/QUR0160.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode31.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode31.fastq.gz > basecalled_data/QUR0172.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode33.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode33.fastq.gz > basecalled_data/QUR0101.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode34.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode34.fastq.gz > basecalled_data/QUR0113.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode35.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode35.fastq.gz > basecalled_data/QUR0125.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode36.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode36.fastq.gz > basecalled_data/QUR0137.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode37.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode37.fastq.gz > basecalled_data/QUR0149.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode38.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode38.fastq.gz > basecalled_data/QUR0161.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode39.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode39.fastq.gz > basecalled_data/QUR0093.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode41.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode41.fastq.gz > basecalled_data/QUR0102.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode42.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode42.fastq.gz > basecalled_data/QUR0114.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode43.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode43.fastq.gz > basecalled_data/QUR0126.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode44.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode44.fastq.gz > basecalled_data/QUR0138.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode45.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode45.fastq.gz > basecalled_data/QUR0150.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode46.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode46.fastq.gz > basecalled_data/QUR0162.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode47.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode47.fastq.gz > basecalled_data/QUR0094.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode49.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode49.fastq.gz > basecalled_data/QUR0103.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode50.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode50.fastq.gz > basecalled_data/QUR0115.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode51.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode51.fastq.gz > basecalled_data/QUR0127.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode52.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode52.fastq.gz > basecalled_data/QUR0139.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode53.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode53.fastq.gz > basecalled_data/QUR0151.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode54.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode54.fastq.gz > basecalled_data/QUR0163.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode55.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode55.fastq.gz > basecalled_data/QUR0095.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode57.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode57.fastq.gz > basecalled_data/QUR0104.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode58.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode58.fastq.gz > basecalled_data/QUR0116.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode59.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode59.fastq.gz > basecalled_data/QUR0128.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode60.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode60.fastq.gz > basecalled_data/QUR0140.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode61.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode61.fastq.gz > basecalled_data/QUR0152.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode62.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode62.fastq.gz > basecalled_data/QUR0164.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode63.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode63.fastq.gz > basecalled_data/QUR0096.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode65.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode65.fastq.gz > basecalled_data/QUR0105.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode66.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode66.fastq.gz > basecalled_data/QUR0117.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode67.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode67.fastq.gz > basecalled_data/QUR0129.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode68.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode68.fastq.gz > basecalled_data/QUR0141.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode69.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode69.fastq.gz > basecalled_data/QUR0153.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode70.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode70.fastq.gz > basecalled_data/QUR0165.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode73.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode73.fastq.gz > basecalled_data/QUR0106.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode74.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode74.fastq.gz > basecalled_data/QUR0118.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode75.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode75.fastq.gz > basecalled_data/QUR0130.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode76.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode76.fastq.gz > basecalled_data/QUR0142.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode77.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode77.fastq.gz > basecalled_data/QUR0154.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode78.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode78.fastq.gz > basecalled_data/QUR0166.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode81.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode81.fastq.gz > basecalled_data/QUR0107.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode82.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode82.fastq.gz > basecalled_data/QUR0119.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode83.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode83.fastq.gz > basecalled_data/QUR0131.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode84.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode84.fastq.gz > basecalled_data/QUR0143.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode85.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode85.fastq.gz > basecalled_data/QUR0155.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode86.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode86.fastq.gz > basecalled_data/QUR0167.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode89.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode89.fastq.gz > basecalled_data/QUR0108.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode90.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode90.fastq.gz > basecalled_data/QUR0120.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode91.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode91.fastq.gz > basecalled_data/QUR0132.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode92.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode92.fastq.gz > basecalled_data/QUR0144.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode93.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode93.fastq.gz > basecalled_data/QUR0156.fastq.gz
cat QUR0093-0172_with_ampure/SQK-RBK114-96_barcode94.fastq.gz QUR0093-0172_with_kit_beads/SQK-RBK114-96_barcode94.fastq.gz > basecalled_data/QUR0168.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode06.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode01.fastq.gz > basecalled_data/QUR0003.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode46.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode09.fastq.gz > basecalled_data/QUR0008.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode01.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode14.fastq.gz > basecalled_data/QUR0173.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode54.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode17.fastq.gz > basecalled_data/QUR0009.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode17.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode22.fastq.gz > basecalled_data/QUR0175.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode33.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode30.fastq.gz > basecalled_data/QUR0177.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode49.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode38.fastq.gz > basecalled_data/QUR0179.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode11.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode46.fastq.gz > basecalled_data/QUR0198.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode04.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode54.fastq.gz > basecalled_data/QUR0209.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode61.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode86.fastq.gz > basecalled_data/QUR0266.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode69.fastq.gz Rhizobia_gDNA_reseq/SQK-RBK114-96_barcode94.fastq.gz > basecalled_data/QUR0267.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode02.fastq.gz > basecalled_data/QUR0185.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode03.fastq.gz > basecalled_data/QUR0197.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode05.fastq.gz > basecalled_data/QUR0259.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode09.fastq.gz > basecalled_data/QUR0174.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode10.fastq.gz > basecalled_data/QUR0186.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode12.fastq.gz > basecalled_data/QUR0210.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode13.fastq.gz > basecalled_data/QUR0260.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode14.fastq.gz > basecalled_data/QUR0004.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode18.fastq.gz > basecalled_data/QUR0187.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode19.fastq.gz > basecalled_data/QUR0199.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode20.fastq.gz > basecalled_data/QUR0211.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode21.fastq.gz > basecalled_data/QUR0261.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode22.fastq.gz > basecalled_data/QUR0005.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode25.fastq.gz > basecalled_data/QUR0176.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode26.fastq.gz > basecalled_data/QUR0188.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode27.fastq.gz > basecalled_data/QUR0200.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode28.fastq.gz > basecalled_data/QUR0212.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode29.fastq.gz > basecalled_data/QUR0262.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode30.fastq.gz > basecalled_data/QUR0006.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode34.fastq.gz > basecalled_data/QUR0189.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode35.fastq.gz > basecalled_data/QUR0201.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode36.fastq.gz > basecalled_data/QUR0213.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode37.fastq.gz > basecalled_data/QUR0263.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode38.fastq.gz > basecalled_data/QUR0007.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode41.fastq.gz > basecalled_data/QUR0178.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode42.fastq.gz > basecalled_data/QUR0190.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode43.fastq.gz > basecalled_data/QUR0202.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode44.fastq.gz > basecalled_data/QUR0214.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode45.fastq.gz > basecalled_data/QUR0264.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode50.fastq.gz > basecalled_data/QUR0191.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode51.fastq.gz > basecalled_data/QUR0203.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode52.fastq.gz > basecalled_data/QUR0225.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode53.fastq.gz > basecalled_data/QUR0265.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode57.fastq.gz > basecalled_data/QUR0180.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode58.fastq.gz > basecalled_data/QUR0192.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode59.fastq.gz > basecalled_data/QUR0204.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode60.fastq.gz > basecalled_data/QUR0226.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode62.fastq.gz > basecalled_data/QUR0010.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode65.fastq.gz > basecalled_data/QUR0181.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode66.fastq.gz > basecalled_data/QUR0193.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode67.fastq.gz > basecalled_data/QUR0205.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode68.fastq.gz > basecalled_data/QUR0227.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode70.fastq.gz > basecalled_data/QUR0011.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode73.fastq.gz > basecalled_data/QUR0182.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode74.fastq.gz > basecalled_data/QUR0194.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode75.fastq.gz > basecalled_data/QUR0206.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode76.fastq.gz > basecalled_data/QUR0228.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode77.fastq.gz > basecalled_data/QUR0268.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode78.fastq.gz > basecalled_data/QUR0012.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode81.fastq.gz > basecalled_data/QUR0183.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode82.fastq.gz > basecalled_data/QUR0195.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode83.fastq.gz > basecalled_data/QUR0207.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode84.fastq.gz > basecalled_data/QUR0257.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode85.fastq.gz > basecalled_data/QUR0001.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode89.fastq.gz > basecalled_data/QUR0184.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode90.fastq.gz > basecalled_data/QUR0196.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode91.fastq.gz > basecalled_data/QUR0208.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode92.fastq.gz > basecalled_data/QUR0258.fastq.gz
cat Rhizobia_Bean_gDNA/SQK-RBK114-96_barcode93.fastq.gz > basecalled_data/QUR0002.fastq.gz

# Remove unnecessary data to save space
rm -r QUR0013-0092/
rm -r QUR0093-0172_with_ampure/
rm -r QUR0093-0172_with_kit_beads/
rm -r Rhizobia_Bean_gDNA/
rm -r Rhizobia_gDNA_reseq/

# Perform genome assembly with an automated pipeline that includes CheckM QC and GTDB-tk classification
ls -1 basecalled_data/ > temp1.txt
ls -1 basecalled_data/ | sed 's/.fastq.gz//' > temp2.txt
paste temp2.txt temp1.txt > sample_list.txt
rm temp1.txt temp2.txt
nanopore_batch_assembly.sh sample_list.txt /workingdisk1/George/9_BENEFIT_Microbes/Phaseolus_symbionts_2023/1_Assembly/basecalled_data/ 16 7.5m 75 5000
