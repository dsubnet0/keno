#!/usr/bin/perl

use strict;
use warnings;
use KenoDrawing;

my $NUMBER_OF_GAMES = 487673;

my $CurrGame;

foreach (1..$NUMBER_OF_GAMES) {
    print;
    $CurrGame = KenoDrawing->new();
    $CurrGame->saveToDatabase();
    print "\n";
}

print "Done\n";
