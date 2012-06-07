#!/usr/bin/perl

use WWW::Mechanize;
use strict;
use warnings;

my $url = "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx";

my $game_number = "00421370";

my $mechObject= WWW::Mechanize->new(autocheck => 1);
$mechObject->get($url);
$mechObject->field("txGame", $game_number);
#$mechObject->field("txDT", '01-01-2008');

$mechObject->click("btnGMGo");

my $text = $mechObject->content();
print $text;
print "\n====================================\n\n";

$mechObject->click("btn_right");
$text = $mechObject->content();
print $text;

