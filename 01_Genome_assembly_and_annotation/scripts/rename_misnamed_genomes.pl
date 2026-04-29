#!/usr/bin/perl
use 5.010;

while(<>) {
    chomp;
    @line = split("\t", $_);
    $new_name = @line[0];
    $new_name =~ s/@line[5]/@line[6]/g;
    $new_name = '5_Good_assemblies/' . $new_name . '.fasta';
    $old_name = '5_Good_assemblies/' . @line[0] . '.fasta';
    system("mv $old_name $new_name");
}
