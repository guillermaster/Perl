#!/usr/bin/perl 

sub FindPeak{
	my @numbers = @_;
	my $half = int($#numbers / 2);
	print "$half\n";

	if($numbers[$half+1] > $numbers[$half]){
		FindPeak(@numbers[$half+1..$#numbers]);
	}
	else {
		if($numbers[$half-1] > $numbers[$half]){
			FindPeak(@numbers[0..$half-1]);
		}
		else{
			return $numbers[$half];
		}
	}
}


print "PEAK: ".FindPeak((1, 3, 4, 3, 5, 1, 3));