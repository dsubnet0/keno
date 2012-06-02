#!/usr/bin/perl

package KenoDrawing;

use strict;
use Data::Dumper;

my $current_id = 0;

sub new {
	my $class = shift;
	my $self = {@_};
	bless($self, $class);
	$self->_init();
	return $self;
}

sub _init {
	my $self = shift;
	$self->{numbers} = $self->drawNumbers();
	$self->{create_date} = scalar(localtime);
	$self->{id} = ++$current_id;
}

sub drawNumbers {
	my $number_of_balls = 20;
	my %result_array = ();
	my $current_draw = 0;
	while ((keys %result_array) < $number_of_balls) {
		$current_draw = int(rand(80))+1;
		unless ($result_array{$current_draw}) {
			$result_array{$current_draw}++;
		}
	}
	my @result_array = (sort {$a<=>$b} keys %result_array);
	return \@result_array;
}

sub printNumbers {
	my $self = shift;
	for (my $i; $i<@{$self->{numbers}}; $i++) {
		unless ($i % 5) { print "\n"; }
		print $self->{numbers}->[$i]." ";
	}
	print "\n\n";
}

1;
