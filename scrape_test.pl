#!/usr/bin/perl
use strict;
use warnings;
use LWP;
use Data::Dumper;

my $url = "http://webkeno1.msla.state.md.us/kenosearch/kenosearch.aspx";

#my $get_content = get($url);

#print "$content\n";

my $user_agent = LWP::UserAgent->new();

my $post_response = $user_agent->post($url, ['txGame'=>'00421370']);
#print "".$post_response->content."\n";
print Dumper($post_response);
