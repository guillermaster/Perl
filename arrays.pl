#!/usr/bin/perl

# create a simple array
@coins = ("Quarter","Dime","Nickel");
print "1. \@coins  = @coins\n";

# add one element at the end of the array
push @coins, "Penny";
print "2. \@coins  = @coins\n";

# add one element at the beginning of the array
unshift @coins, "Dollar";
print "3. \@coins  = @coins\n";

# remove one element from the last of the array.
pop(@coins);
print "4. \@coins  = @coins\n";

# remove one element from the beginning of the array.
shift(@coins);
print "5. \@coins  = @coins\n";

@days = qw/Mon Tue Wed Thu Fri Sat Sun/;

@weekdays = @days[3,4,5];

print "$#weekdays\n";
print "@weekdays\n";

# define an array
@foods = qw(pizza steak chicken burgers);
$strFoods = join("+", @foods);
print "Before: $strFoods\n";

# sort this array
@foods = sort(@foods);
print "After: @foods\n";