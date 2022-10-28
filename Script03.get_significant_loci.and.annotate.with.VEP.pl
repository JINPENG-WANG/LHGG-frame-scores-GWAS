#!/usr/bin/perl -w
use strict;
use IO::File;

#my @types=qw(Foot_heel_depth Fore_udder_attachment Front_teat_placement Rear_leg_side_view Rear_teat_placement Rear_udder_width Body_depth);
my @assoc_FDRs=<*.lm2.assoc.FDR.txt>;
for my $assoc_FDR (@assoc_FDRs) {
	my $fh_lm2_assoc_FDR=IO::File->new("$assoc_FDR",'r');
	my $type;
	if($assoc_FDR=~/(\w+)\.lm2\.assoc\.FDR\.txt/){
		$type=$1;
	}

	my %significant;
	my $line_count;
	my $significant_count=0;
	while(<$fh_lm2_assoc_FDR>){
		chomp;
		my $line = $_;
		$line_count++;
		if($line_count>1){
			my @eles = split /\s+/, $line;
			my ($locus, $FDR)=@eles[2,10];
			if($FDR<0.05){
				$significant_count++;
				$significant{$locus}=$FDR;
			}
		}
	}
	if($significant_count>0){

		my $fh_out=IO::File->new(">$type.VEP.significant.annotation.txt");
		my $fh_in = IO::File->new("symboled.reformat.LHGGfilter.vep.out",'r');
		while(<$fh_in>){
			chomp;
			my $line = $_;
			my @eles = split /\t/, $line;
			my $locus=$eles[1];
			if(exists $significant{$locus}){
				my $p = $significant{$locus};

				$fh_out->print("$locus\t$p\t$line\n");
			}
		}
	}
}
