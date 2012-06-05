#!/usr/bin/perl

use strict;
use warnings;
use PostScraper;

my $STARTING_GAME_NUMBER = 425370;
my $rows_extracted = 0;

my $current_game_number = $STARTING_GAME_NUMBER;
my $myPS = PostScraper->new(url => "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx");

while ($current_game_number < 425470) {
   print "$rows_extracted rows extracted so far\n";
    my $myPS = PostScraper->new(
                                url => "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx",
                                values => [
                                           'txGame'=>$current_game_number, 
                                           'btnGMGo'=>'GO', 
                                           '__VIEWSTATE'=>'dDw3Nzg3MDEwNDs7Ptfs4xYjCZmzRj4HNFuK3TLncOwL'                                          
                                           ]
                               );
    $myPS->postResultsTableCsv();
    $rows_extracted += 15;
    $current_game_number += 15;
}
