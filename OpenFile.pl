open(DATA, "<sample.txt");

my @lines = <DATA>;

foreach $line(@lines){
	print "$line";
}