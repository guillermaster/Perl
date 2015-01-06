%data = ('John Paul' => 45, 'Lisa' => 30, 'Kumar' => 40);

print "$data{'John Paul'}\n";
print "$data{'Lisa'}\n";
print "$data{'Kumar'}\n";

if( exists($data{'Guillermo'}) ){
	print $data{'Guillermo'};
}
else{
	print "Doesn't exists";
}