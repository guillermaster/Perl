$aref = [
	[ "fred", "barney", "pebbles", "bambam", "dino", ],
	[ "homer", "bart", "marge", "maggie", ],
	[ "george", "jane", "elroy", "judy", ],
    ];
	
@names = (["nelly", "valentina"],
		  ["guillermo", "sebastian", "papito"],
		  ["nelly", "cecilia"],
		  ["guillermo", "andres"]);

push @names, ["nelly", "guillermo"];
	
print "$aref->[3][1]\n";
print "$#{$names[1]}\n";

for ($i=0; $i<=$#names; $i++){
	for($j=0; $j<=$#{$names[$i]}; $j++){
		print "$names[$i][$j] ";
	}
	print "\n";
}
