#!/usr/bin/perl
use 5.010;

$filename = @ARGV[0];
$nolL = 0;
$nolO = 0;
$nodD = 0;
while(<>) {
    @line = split("\t", $_);
    if(@line[2] eq 'CDS') {
        if(/nolL/) {
            $nolL = 1;

            # Get the locus tag
            @info = split('ID=cds-', $_);
            @info2 = split(';', @info[1]);
            $locus_tag = @info2[0];

            # Get the gene name if it exists
            if(/;gene=/) {
                @info = split(';gene=', $_);
                @info2 = split(';', @info[1]);
                $gene = @info2[0]
            }
            else {
                $gene = '';
            }

            # Get the start and end positions as well as orientation
            $start = @line[3];
            $end = @line[4];
            if(@line[6] eq '+') {
                $strand = 'forward';
                $orientation = 1;
            }
            elsif(@line[6] eq '-') {
                $strand = 'reverse';
                $orientation = 0;
            }
            
            # Check if pseudo
            if(/pseudo=true/) {
                $pseudo = 1;
            }
            else {
                $pseudo = 0;
            }

            # Print the information
            say("$filename\t$locus_tag\t$gene\t$start\t$end\t$strand\t$orientation\t$pseudo");
        }
        elsif($nolL == 1 && $nolO == 0) {
            if(/nodD1/) {
                $nodD = 1;
            }
            if($nodD == 1) {
                if(/carbamoyltransferase/) {
                    $nolO = 1;
                }
            }

            # Get the locus tag
            @info = split('ID=cds-', $_);
            @info2 = split(';', @info[1]);
            $locus_tag = @info2[0];

            # Get the gene name if it exists
            if(/;gene=/) {
                @info = split(';gene=', $_);
                @info2 = split(';', @info[1]);
                $gene = @info2[0]
            }
            else {
                $gene = '';
            }

            # Get the start and end positions as well as orientation
            $start = @line[3];
            $end = @line[4];
            if(@line[6] eq '+') {
                $strand = 'forward';
                $orientation = 1;
            }
            elsif(@line[6] eq '-') {
                $strand = 'reverse';
                $orientation = 0;
            }
            
            # Check if pseudo
            if(/pseudo=true/) {
                $pseudo = 1;
            }
            else {
                $pseudo = 0;
            }

            # Print the information
            say("$filename\t$locus_tag\t$gene\t$start\t$end\t$strand\t$orientation\t$pseudo");
        }
    }
}