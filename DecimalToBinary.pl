sub DecimalToBinary
{
	my $dec = @_[0];
	my $quotient = int ($dec/2);

	if($dec == 0){
		return "";
	}
	else
	{
		my $reminder = $dec % 2;
		my $bin = DecimalToBinary( $quotient ).$reminder;
		return $bin;
	}	
}

for $i (0..15){
	$decimal = DecimalToBinary($i);
	print "$i:  $decimal\n";
}