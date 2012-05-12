#!/usr/bin/perl

package KenoDrawing;

use strict;

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
	my %result_array = {};
	while (%result_array < $number_of_balls) {
		my $current_draw = int(rand(80))+1;
		unless ($result_array{$current_draw}) {
			$result_array{$current_draw}++;
		}
	}
	return (keys %result_array);
}

1;
