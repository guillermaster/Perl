%fibomem = (1 => 1, 0 => 0);

sub Fibonacci{
	my $number = @_[0];
	my $fib = 0;

	#if($number == 1 || $number==0){
	#	$fib = $number;
	#}	
	if(exists($fibomem{$number})){
		$fib = $fibomem{$number};
	}
	else{
		$fib = Fibonacci($number-1) + Fibonacci($number-2);
		$fibomem{$number} = $fib;
	}
	return $fib;
}

#print $fibomem{1};
print Fibonacci(8);