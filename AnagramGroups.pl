sub AnagramGroups{
	my @wordsArray = @_;
	my %anagHash = {};
	
	foreach $word1 (@wordsArray){
		my @hashValue = ();
		$wordRearranged = RearrangeWord($word1);

		if(exists($anagHash{$wordRearranged})){
			@hashValue = @{ $anagHash{$wordRearranged} };			
		}

		push @hashValue, $word1;
		$anagHash{$wordRearranged} = [@hashValue];
	}

	#loop hash table and print values
	foreach $key (keys(%anagHash)){
		for(my $i=0; $i<=$#{ $anagHash{$key} }; $i++){
			print $anagHash{$key}[$i]."-";
		}
		print "\n";
	}
}

sub RearrangeWord {
	my $word = @_[0];
	my $wordLength = length($word);
	my @wordArray = ();
	my @rearranged = ();
	my $subs;

	for(my $i=0; $i<$wordLength; $i++){
		$subs = substr($word, $i, 1);
		if ($subs ne " ") {
			push @wordArray, $subs;
		}
	}

	@rearranged = OrderCharArray( @wordArray);

	return join '', @rearranged;
}

sub OrderCharArray{ 
	my @charArray = @_;
	
	if($#charArray <= 0){
		return @charArray;
	}
	else
	{
		my @left = ();
		my @right = ();
		my $middle = int ($#charArray / 2);
		#print $#charArray;
		my @result = ();

		for(my $i=0; $i<=$middle; $i++){
			push @left, $charArray[$i];
		}
		for(my $i=$middle+1; $i<=$#charArray; $i++){
			push @right, $charArray[$i];
		}

		@left = OrderCharArray(@left);
		@right = OrderCharArray(@right);

		while($#left>=0 && $#right>=0){
			#print $left[0];
			if($left[0] le $right[0]){
				push( @result, shift(@left) );
			}
			else{
				push( @result, shift(@right) );
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


@words = ("pear","dirty room","amleth","reap","tinsel","hamlet","dormitory","listen","silent");
AnagramGroups(@words);