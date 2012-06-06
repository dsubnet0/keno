#!/usr/bin/perl

use strict;
use warnings;
use PostScraper;

$| = 1;

my $STARTING_GAME_NUMBER = $ARGV[0] || 421370;
my $rows_extracted = 0;

my $current_game_number = $STARTING_GAME_NUMBER;
my $myPS = PostScraper->new(url => "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx");

while ($current_game_number < 906304) {
    open OUTPUTCSV,">>keno_results.csv";
    print "$rows_extracted rows extracted so far\n";
   
    $myPS = PostScraper->new(
                                url => "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx",
                                values => [
                                           'txGame'=>$current_game_number, 
                                           'btnGMGo'=>'GO', 
                                           '__VIEWSTATE'=>'dDw3Nzg3MDEwNDs7Ptfs4xYjCZmzRj4HNFuK3TLncOwL'                                          
                                           ]
                               );
    $myPS->postResultsTableCsv(\*OUTPUTCSV);
    $rows_extracted += 15;
    $current_game_number += 15;
    close OUTPUTCSV;
    $myPS = undef;
    print "Pausing...\n";
    sleep 1;
}
