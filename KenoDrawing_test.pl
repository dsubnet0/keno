#!/usr/bin/perl

use strict;
use warnings;
use KenoDrawing;
use Data::Dumper;

my @games = ();
$games[0] = KenoDrawing->new();
sleep 1;
$games[1] = KenoDrawing->new();
#print Dumper(\@games);
foreach my $game (@games) {
	print "Game #".$game->{id}.":\n";
	$game->printNumbers();
}
