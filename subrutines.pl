#!/usr/bin/perl

# Function definition
sub Average{
   # get total number of arguments passed.
   $n = scalar(@_);
   $sum = 0;

   foreach $item (@_){
      $sum += $item;
   }
   $average = $sum / $n;

   return $average;
}

# Function call
$num = Average(10, 20, 30);
print "Average for the given numbers : $num\n";


sub ellipse_area {
  my ($r1, $r2) = @_;
  my $pi = 3.1416;
  my $area = $r1 * $r2 * $pi;
  return $area;
}

print ellipse_area(12, 15);