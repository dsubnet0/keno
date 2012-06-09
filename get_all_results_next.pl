#!/usr/bin/perl

use strict;
use warnings;
use WWW::Mechanize;
use HTML::TableExtract;

$| = 1;

my $url = "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx";

my $game_number = $ARGV[0] || "00421370";

my $mechObject= WWW::Mechanize->new(autocheck => 1); 
$mechObject->get($url);
$mechObject->field("txGame", $game_number);
$mechObject->click("btnGMGo");

printCsvResultsTableFromHtml($mechObject->content());
while (1) {
    sleep 3;
    $mechObject->click("btn_right");
    printCsvResultsTableFromHtml($mechObject->content());
}


# subs

sub printCsvResultsTableFromHtml {
    my $html = shift;

    my $tableExtract = HTML::TableExtract->new(headers=>["DrawID", "Draw Date", "Keno Numbers", "Bonus", "Super Bonus"]);
    $tableExtract->parse($html);
    foreach my $row ($tableExtract->rows) {
        print join(',', @$row), "\n";
    }
}
