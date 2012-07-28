#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use DBI;

my $coin = 0;
my $games_played = 0;
my $table;
my $result_hashref;
my $sth;
my @numbers_string;
my @numbers_int;
my $dbh = DBI->connect('DBI:mysql:keno', 'doug', 'Checkmate1') or die "$!";
while ($games_played < 5) {
    #Decide on md or perl
    $coin = int(rand(2));

    if ($coin) { $table = "md_keno";} else { $table = "perl_keno";}
    print "$table\n";
    $sth = $dbh->prepare("SELECT keno_numbers FROM $table ORDER BY RAND() LIMIT 1");
    $sth->execute();
    $result_hashref = $sth->fetchrow_hashref();
    @numbers_string = split(' ',$result_hashref->{keno_numbers});
    @numbers_int = ();
    push (@numbers_int,int($_)) foreach (sort @numbers_string);

    #print "$_ " foreach (sort {$a<=>$b} @numbers_int);
    #print "\n";
    
    printAllNumbersGrid(\@numbers_int);

    $games_played++;
}
 

sub printAllNumbersGrid {
    my $numbers_arrayref = shift;
    my %numbers;
    @numbers{@$numbers_arrayref} = ();
    my $spacer;
    for (my $i=1; $i<=80; $i++) {
        if (exists $numbers{$i}) {
            $spacer = "*";
        } else {
            $spacer = " ";
        }
        print $spacer;
        printf("%02d",$i);
        print $spacer;
        if ($i % 10 == 0){ print "\n";}
    }   
    print "\n\n";
}

sub printResultsGrid {

}
