#!/usr/bin/perl
use 5.010;

# Get list of samples, which is the same file used to run the bulk assembly
$metadata = @ARGV[0];
open($in, '<', $samplmetadatae_list);
while(<>) {
    chomp;
    @line = split("\t", $_);
    $cmd = 'rename s/annot/' . @line[1] . '_' . @line[0] . '/ temp/' . @line[1] . '_' . @line[0] . '/annot*';
    system("$cmd");
}

