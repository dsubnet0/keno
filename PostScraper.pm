#!/usr/bin/perl

package PostScraper;

use strict;
use LWP;
use HTML::TableExtract;

sub new {
	my $class = shift;
	my $self = {@_};
	bless($self, $class);
	$self->_init();
	return $self;
}

sub _init {
	my $self = shift;
	unless (defined $self->{url}) {
		die "Need a URL";
	}
	unless (defined $self->{values}) {
		$self->{values} = ();
	}
}

sub getPostResponseContent {
	my $self = shift;
	
	unless (defined $self->{postResponseContent}) {
        print "Retrieving POST response for ".join(',',@{$self->{values}})."...\n";
        my $user_agent = LWP::UserAgent->new();
    	my $response = $user_agent->post($self->{url}, $self->{values});
        $self->{postResponseContent} = $response->content;
    }
	return $self->{postResponseContent};
}

sub postResultsTableCsv {
    my $self = shift;
    my $HtmlExtract = HTML::TableExtract->new(headers=>["DrawID","Draw Date", "Keno Numbers", "Bonus", "Super Bonus"]);
    $HtmlExtract->parse($self->getPostResponseContent());
    foreach my $row ($HtmlExtract->rows) {
        print join(',', @$row), "\n";
    }
}

1;
