#!/usr/bin/perl

use strict;
use warnings;
use DBI;
use Data::Dumper;

$| = 1;

my $dbh = DBI->connect('DBI:mysql:keno', 'doug', 'Checkmate1') or die "$!";

my $sth = $dbh->prepare(q{SELECT COUNT(1) AS cnt FROM load_table WHERE keno_numbers LIKE ?});
my $i = 0;
foreach my $number (qw{01 02 03 04 05 06 07 08 09},10..80) {
    $sth->execute("\%$number\%");
    my $result_hashref = $sth->fetchrow_hashref();
    print $result_hashref->{cnt}." ";
}
