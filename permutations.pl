#!/usr/bin/perl
# 



sub permutations {
    my $word = @_[0];
    my @result;
    
    if (length($word) == 1){
        push @result, $word;
        return @result;
    }
    else
    {
        my @perms = permutations(substr($word, 1, length($word)));
        my $char = substr($word, 0, 1);
        
        #print "perms length: ".$#perms."\n";

        foreach $perm (@perms) {
            for $i (0 .. (length($perm))){
                push(@result, substr($perm, 0, $i).$char.substr($perm, $i, length($perm)))
            }
        }

        return @result;
    }
}

@perms = permutations("sebi");

print $#perms."\n\n";

foreach $word1 (@perms){
    print "$word1\n";
}