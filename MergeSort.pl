#!/usr/bin/perl

sub MergeSort {
	my @unsorted_array = @_;
	my @left; 
	my @right;
	my @result;
	

	if($#unsorted_array<=0){
		return @unsorted_array;
	}
	else
	{
		my $middle = int(($#unsorted_array + 1) / 2);

		for(my $i=0; $i<$middle; $i++)
		{
			push @left, $unsorted_array[$i];
		}

		for(my $i=$middle; $i<=$#unsorted_array; $i++){
			push @right, $unsorted_array[$i];
		}

		@left = MergeSort(@left);
		@right = MergeSort(@right);

		while($#left>=0 && $#right>=0){
			if($left[0] <= $right[0]){
				push (@result, shift @left);
			}
			else{
				push (@result, shift @right);
			}
		}

		if($#left >= 0){
			push @result, @left;
		}
		if($#right >= 0){
			push @result, @right;
		}

		return @result;
	}
}

@uarray = (9,4,2,7,5,6,3,1,8);
@sarray = MergeSort(@uarray);

print join("-", @sarray);