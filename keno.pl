#!/usr/bin/perl

use warnings;
use Data::Dumper;

my $loops = 1000;
my %PAYOFF = (0,4,5,2,6,10,7,50,8,400,9,4000,10,100000);

for (my $k=1;$k<=$loops;$k++) {
my @picks = (35,69,71,51,8,47,18,72,80,52);

#print "\n\n"; 
#print Dumper(\@picks);
my $num_games = 10;
my $amount_played = 1;
my $initial_bankroll = 200;
my $bankroll = $initial_bankroll;
my $sessions_played = 0;

while ($bankroll >= $num_games*$amount_played && $bankroll < ($initial_bankroll*2)) {
	my $session_winnings = -$num_games*$amount_played;
for (my $j=1;$j<=$num_games;$j++) {
	my $curr_winnings = 0;
	my %results=();
	for (my $i=1;$i<=20;$i++){
		#push(%results,int(rand(80))+1);
		$results{int(rand(80))+1}=1;
	}

	#PrintArray(\%results);
	my $curr_hits = CountHits(\%results,\@picks);
	if ($PAYOFF{$curr_hits}) {
		$curr_winnings = $PAYOFF{$curr_hits};
	} else {
		$curr_winnings = 0;
	}
	$session_winnings += $curr_winnings;
	#print "\ncurrent hits = $curr_hits for $curr_winnings dollars\n";
	#print "total winnings = $session_winnings\n\n";
}
	$bankroll += $session_winnings;
	++$sessions_played;
	#print "Sessions played = ".$sessions_played."\n";
	#print "BANKROLL = $bankroll\n\n";
}

print "$num_games,$sessions_played,$initial_bankroll,$bankroll,favorites\n";

}


#################################

sub CountHits {
	my %r = %{$_[0]};
	my @p = @{$_[1]}; 
	my $hits = 0;

	foreach my $curr (@p) {
		if (exists($r{$curr})) {
			 $hits++;
		}
	}

	return $hits;
}



sub PrintArray {
	my @array = keys %{$_[0]};
	my $linecount=0;

	foreach my $curr (sort { $a <=> $b } @array) {
		$linecount++;
		printf '%2d ', $curr;
		if ($linecount == 4) {
			print "\n";
			$linecount=0;
		}
	}
}
