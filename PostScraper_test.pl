#!/usr/bin/perl

use strict;
use warnings;
use PostScraper;
use Data::Dumper;

my $keno1 = PostScraper->new(
                                url => "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx",
                                values => [
                                            'txGame'=>'00421370', 
                                            'btnGMGo'=>'GO', 
                                            '__VIEWSTATE'=>'dDw3Nzg3MDEwNDs7Ptfs4xYjCZmzRj4HNFuK3TLncOwL'
                                          ]
                            );

#my $response = $keno1->getPostResponseContent();
#print Dumper($response);
#print Dumper($keno1->getPostResponseContent());
##print Dumper({$keno1->getPostResultsTable}->rows);
my $ResultsTable = $keno1->getPostResultsTable();
#print Dumper($ResultsTable->rows);
$keno1->postResultsTableCsv();


