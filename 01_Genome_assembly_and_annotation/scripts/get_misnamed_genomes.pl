#!/usr/bin/perl
use 5.010;

$output1 = 'genomes_to_rename.txt';
$output2 = 'genomes_to_remove_name.txt';
open($out1, '>', $output1);
open($out2, '>', $output2);
while(<>) {
    chomp;
    @line = split("\t", $_);
    if(@line[2] >= 95) {
        if(@line[5] eq @line[6]) {
        }
        else {
            say $out1 ($_);
        }
    }
    else {
        @line2 = split('_', @line[5]);
        if(@line2[1] eq 'sp') {
        }
        else {
            say $out2 ($_);
        }
    }
}
close($out1);
close($out2);
