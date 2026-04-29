mv 2_Annotation/ 6_PGAP_annotations/
mv 1_Assembly/* .
rm -r 1_Assembly/
prepare_metadata_file.pl sample_list.txt
mv 6_PGAP_annotations/ temp/
rename_pgap_files.pl metadata.txt
mv temp/ 6_PGAP_annotations/