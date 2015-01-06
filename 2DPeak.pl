#!/usr/bin/perl

sub PeakFind {
	my @params = @_;

	my @matrix = @params[0..$#params-2];
	my $left = @params[$#params-1];
	my $right = @params[$#params];

	my $j = int(($right-$left) / 2) + $left;
	my $max_y = 0;
	my $max_y_idx;

	#get the max value in the middle column
	for(my $i=0; $i<=$#array2d; $i++){
		if($array2d[$i][$j] >= $max_y){
			$max_y = $array2d[$i][$j];
			$max_y_idx = $i;
		}		
	}

	print "j: $j\n";
	print "max: $max_y \n";
	print "max idx: $max_y_idx\n";
	#print "$#{$array2d[$max_y_idx]}\n";

	if( (($j-1 >= 0 && $array2d[$max_y_idx][$j] > $array2d[$max_y_idx][$j-1])) &&
	    (($j+1 <= $#{$array2d[$max_y_idx]}) && $array2d[$max_y_idx][$j] > $array2d[$max_y_idx][$j+1]) ){
	   	return $array2d[$max_y_idx][$j];
	}
	else{ 		
		print $array2d[$max_y_idx][$j+1];
		if($j-1 >= 0 && $array2d[$max_y_idx][$j-1] > $array2d[$max_y_idx][$j]){
			print("left\n\n");
			PeakFind(@matrix, 0, $j-1);			
		}
		else {
			if($j+1 <= $#{$array2d[$max_y_idx]} && $array2d[$max_y_idx][$j+1] > $array2d[$max_y_idx][$j]){
				print "right\n\n";
				PeakFind(@matrix, $j+1, $#{$array2d[$max_y_idx]})
			}
		}
	}
}

@array2d = ([1, 3, 5, 9, 0],
			[2, 3, 4, 2, 1],
			[2, 1, 7, 8, 5],
			[3, 4, 3, 6, 1]);

print PeakFind(@array2d, 0, 4);