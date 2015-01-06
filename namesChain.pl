#!/usr/bin/perl 

sub GetFirstLetterLC{
	my $string = @_[0];
	return lc(substr($string, 0, 1))
}

sub GetLastLetterLC{
	my $string = @_[0];
	return lc(substr($string, length($name)-1, 1))
}

sub NamesChain{
	my @names = @_;
	my %firstLetters;
	my %lastLetters;
	my %chains;
	my @result;
	my $max = 0;
	my $currMaxName = "";
	
	#get to hashtables, one for all first letters from names and other for the last letters of each name
	foreach $name (@names){
		my $firstLetter = GetFirstLetterLC($name);
		my $lastLetter = GetLastLetterLC($name);
		
		if(not(exists($firstLetters{$firstLetter}))){
			$firstLetters{$firstLetter} = $name;
		}
		
		if(not(exists($lastLetters{$lastLetter}))){
			$lastLetters{$lastLetter} = $name;
		}	
	}

	#select each word from the input array and try to generate its chain
	foreach $currName (@names){
		my $nextName = "";
		my $lastLetter = GetLastLetterLC($currName);
		my @chain;
		my $i = 0;		
		#print "$currName: ";

		if(not(exists($chains{$currName}))){
			while(exists($firstLetters{$lastLetter}) && $i<=$#names){				
				#look for next word
				$nextName = $firstLetters{$lastLetter};
				#check if the chain has already been computed
				if(exists($chains{$nextName})){
					push(@chain, $nextName);
					push(@chain, @{$chains{$nextName}});
					$i = $#names;
				}
				else{#compute
					push(@chain, $nextName);
					$lastLetter = GetLastLetterLC($nextName);					
				}	
				$i++;			
			}

			#determine if current chain is the longest one
			if($#chain > $max){
				$max = $#chain;
				$currMaxName = $currName;
			}

			#add current chain to the chains hashtable
			$chains{$currName} = [@chain];
			#print join('-', @{$chains{$currName}});
			#print "\n";
		}
	}
	
	#return the longest chain
	if(not($currMaxName eq "")){
		push(@result,$currMaxName);
		push(@result,@{ $chains{$currMaxName} });
		return @result;
	}
	else{
		return; #there are not possible chains
	}
}


@names_chain = NamesChain(("Luis", "Hector", "Selena", "Emmanuel", "Amish"));

print "SOLUTION: " . join('-',@names_chain);
