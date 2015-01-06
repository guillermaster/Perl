
sub nondecreasing_subsequences {
	my @initArray = @_;
	my @resArray = ();
	if($#initArray > -1){
		my $prev = $initArray[0];
		#print $prev."-";
		my @subsequence = ($prev);

		for(my $i=1; $i<=$#initArray; $i++){
			if($initArray[$i] < $prev){
				push @resArray, [@subsequence];
				@subsequence = ();
				#print "\n".$#resArray."\n";
			}
			$prev = $initArray[$i];
			push @subsequence, $prev;
			#print "$prev-";
		}

		push @resArray, [@subsequence];
	}
	return @resArray;
}

@arr = (3,6,61,6,7,9,1,7,7,2,7,7,2,388,3,72,7);

@nondec = nondecreasing_subsequences(@arr);

#print "\n\n".$#nondec;
for (my $j=0; $j<=$#nondec; $j++){
	for(my $k=0; $k<=$#{ $nondec[$j] }; $k++){
		print $nondec[$j][$k]." - ";
	}	
	print "\n";
}