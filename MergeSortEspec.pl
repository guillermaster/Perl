#!/usr/bin/perl


sub Sort{
	my @unsorted = @_;

	if($#unsorted <= 0){
		return @unsorted;
	}
	else{
		my $middle = int( ($#unsorted+1)/2 );
		my @left;
		my @right;
		my @result;
		#slice array into halves
		print $middle;
		for(my $i=0; $i<$middle; $i++){
			push @left, $unsorted[$i];
			print '$';
		}
		for(my $i=$middle; $i<$#unsorted; $i++){
			push @right, $unsorted[$i];
			print '$';
		}

		#slice array into halves
		for(my $i=0; $i<$#left; $i++){
			print $left[$i]->{name};
		}
		for(my $i=0; $i<$#right; $i++){
			print $right[$i]->{name};
		}

		@left = Sort(@left);
		@right = Sort(@right);

		#MERGE
		while($#left>=0 && $#right>=0){
			print $left[0]{score}."_";
			if($left[0]{score} <= $right[0]{score}){
				push(@result, shift(@left));
			}
			else{
				push(@result, shift(@right));
			}
		}

		if($#left >= 0){
			push @result, @left;
		}
		if($#right >= 0){
			push @result, @right;
		}
	}
}

 @AoH = (
        {
            name  => "Jhon",
            score => 10,
        },
        {
            name  => "Bob",
            score => 1,
        },
        {
            name  => "Carlos",
            score => 5,
        },
        {
            name  => "Alice",
            score => 5,
        },
        {
            name  => "Donald",
            score => 7,
        }
  );
#shift(@AoH);
#print $AoH[0]{score};
@sorted = Sort(@AoH);
#print $#sorted;
#for($i=0; $i<=$#sorted; $i++){
#	print $sorted{name}."\n";
#}