#!/usr/bin/perl 
use strict;
use warnings;
use Data::Dumper qw(Dumper);

#----------------------------------------------
#----------------------------------------------

if(scalar(@ARGV) <= 0){
print "\nconverts hex encoded url string into ascii\n";
print 'ex: ./urlHexToStr.pl "https%3A%2F%2Fsomedomain.com%2Fsome%2Fpath%2Fsome.file"'."\n\n\n";
exit 0;
}


my $in=$ARGV[0];




my $rtrn='';
my $i=0;
  while($in=~/(%[0-9A-Za-z]{2,2})/g){
  
  my $len=length($1);
  my $pos=pos($in);
  my $hex=$1;
  $hex=~s/%//;
  #print'"============ i:'.$i.', pos:'.$pos.', len:'.$len.', sub: '.($pos-$len-$i)."\n".substr($in,$i,$pos-$len-$i)."\n".pack("H*", $hex)."\n";
  $rtrn.=substr($in,$i,$pos-$len-$i).pack("H*", $hex);
  $i=$pos;
  }

my $len=length($in)-$i;

print $rtrn.substr($in,$i,$len)."\n\n";

exit 0;
