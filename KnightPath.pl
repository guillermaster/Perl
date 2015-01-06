#!/usr/bin/perl

@chessboard = ( ['a','b','c','d','e'],
				['f,','g','h','i','j'],
				['k','l','m','n','o'],
				['p','q','r','s','t'],
				['u','v','w','x','y'] );

sub GetPosition{
	my $start = @_[0];
	my $startPos;
	my $founded = 0;
	#get position of start place
	for(my $i=0; $i<=$#chessboard && $founded==0; $i++){
		for(my $j=0; $j <= $#{$chessboard[$i]} && $founded==0; $j++){
			if($chessboard[$i][$j] eq $start){
				$startPos = $i.",".$j;
				$founded = 1;
			}
		}
	}
	
	return $startPos;
}



sub KnightAdjacents {
	my $i = @_[0];
	my $j = @_[1];
	my @adj;

	if($j-1>=0 && $i-2>=0){
		push (@adj, ($i-2).",".($j-1));
	}
	if($j-2>=0 && $i-1>=0){
		push (@adj, ($i-1).",".($j-2));
	}
	if($j-2>=0 && $i+1<=$#chessboard){
		push (@adj, ($i+1).",".($j-2));
	}
	if($j-1>=0 && $i+2<=$#chessboard){
		push (@adj, ($i+2).",".($j-1));
	}

	if($j+1<=$#{$chessboard[$i]} && $i-2>=0){
		push (@adj, ($i-2).",".($j+1));
	}
	if($j+2<=$#{$chessboard[$i]} && $i-1>=0){
		push (@adj, ($i-1).",".($j+2));
	}
	if($j+2<=$#{$chessboard[$i]} && $i+1<=$#chessboard){
		push (@adj, ($i+1).",".($j+2));
	}
	if($j+1<=$#{$chessboard[$i]} && $i+2<=$#chessboard){
		push (@adj, ($i+2).",".($j+1));
	}

	return @adj;
}

sub KnightPath {
	my $start = @_[0];
	my $end = @_[1];
	my $startPos = GetPosition($start);
	my %level = ($start => 0);
	my %parent = ($start => "");
	my @frontier = $startPos;
	my $pathFounded = 0;
	my $l = 1;#level counter

	print "start: $start\n";
	print "end: $end\n";
	print "start pos: ".$startPos."\n";
	

	while ($#frontier >= 0 && $pathFounded==0){
		my @next;
		my $parent;
		my @uPos;
		my @vPos;

		#loop for every element in frontier while target not founded
		for(my $u=0; $u<=$#frontier && $pathFounded==0; $u++){
			@uPos = split(",", $frontier[$u]);
			$parent = $chessboard[$uPos[0]][$uPos[1]];#char name of parent node			
			my @adj = KnightAdjacents(@uPos);
						
			#loop for every adjacent space
			for(my $v=0; $v<=$#adj && $pathFounded==0; $v++){
				#print "ADJ ".$v.": ".$adj[$v]."\n";				
				
				@uPos = split(",", $adj[$v]);
				my $chessSpace = $chessboard[$uPos[0]][$uPos[1]];

				if(not exists($level{$chessSpace})){
					$level{$chessSpace} = $l;
					$parent{$chessSpace} = $parent;	
					print "parent of $chessSpace: ".$parent{$chessSpace}."\n";
					push(@next, $adj[$v]);#add string with position to next frontier
					#check whether this node is the end (target) node
					if($chessSpace eq $end){
						print "ENCONTRADO en nivel $l";
						$pathFounded = 1;
					}
				}
			}
		}
		@frontier = @next;
		$l++;
	}

	if($pathFounded == 1){
		#print path
		my $path = $end;
		my $node = $end;
		while(exists($parent{$node})){
			$node = $parent{$node};
			$path = $node."-".$path;
		}
		print "PATH FOUNDED: $path";
	}
	else{
		print "NO PATH FOUNDED FROM $start TO $end.";
	}
}



KnightPath('b', 'o');