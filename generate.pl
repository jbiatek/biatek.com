#!/usr/bin/perl

#curl -i http://www.harryhogfootball.com/podcast.xml | sed 's|http://www.podtrac.com/pts/redirect.m4a?||' | sed 's|<title>Harry Hog Football|<title>Hacked! Harry Hog Football|'

my $content = `curl -A "curl/7.18.0" -S -s http://www.harryhogfootball.com/podcast.xml`;

$content =~ s|http://www\.podtrac\.com/pts/redirect\....\?||g;
$content =~ s|<title>Harry Hog Football|<title>Hacked! Harry Hog Football|g;

open(my $xml, '>', 'hhf.xml');
print $xml $content;
close $xml;

print "Wrote content to hhf.xml\n";

