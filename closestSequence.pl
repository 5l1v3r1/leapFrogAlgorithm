#!/usr/bin/perl # GNU (c) 2016 douglas Berdeaux
use strict;     # WeakNet Labs, weaknetlabs.com
use warnings;
sub findClosest($$\@); # prototype
main();
sub main{
 my @a = (4,5,8); # first seq
 my @b = (2,7,8,9,2,1,66,-4,-6); # second seq
 my $diff = 0;
 foreach my $j (@a){ # get the closest diff to each
  $diff += abs($j - findClosest($j,1,@b)) if(!($j~~@b))
 }
 print $diff."\n"; # done.
}
# my very own "leap frog" search algorithm:
sub findClosest ($$\@){ # bleh, so many sigils...
 return ($_[0]+$_[1]) if(($_[0]+$_[1])~~@{$_[2]}); # hop right
 return $_[0]-$_[1] if(($_[0]-$_[1])~~@{$_[2]}); # hop left
 findClosest($_[0],$_[1]+1,@{$_[2]}); # ribbit, recursion, ribbit
}
