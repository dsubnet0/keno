#!/usr/bin/perl

use warnings;
use strict;
use Statistics::ChiSquare;
use Data::Dumper;
use DBI;

my $dbh = DBI->connect('DBI:mysql:keno','doug','Checkmate1') or die "$!";

my $sth = $dbh->prepare("SELECT draw_id,keno_numbers from md_keno");
$sth->execute();
while (my $row_hashref = $sth->fetchrow_hashref()) {
    print $row_hashref->{'draw_id'} ."\n";
    print $row_hashref->{'keno_numbers'} ."\n";
    print chisquare(split(' ', $row_hashref->{'keno_numbers'}))."\n";
    print "\n";
    sleep 1;
}
