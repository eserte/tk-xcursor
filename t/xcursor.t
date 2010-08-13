#!/usr/bin/perl -w
# -*- perl -*-

#
# Author: Slaven Rezic
#

use strict;
use FindBin;
use Tk;
use Tk::Xcursor;

BEGIN {
    if (!eval q{
	use Test::More;
	1;
    }) {
	print "1..0 # skip no Test::More module\n";
	CORE::exit;
    }
}

my $mw = eval { tkinit };
if (!$mw) {
    plan skip_all => "Cannot create MainWindow: $@";
    CORE::exit;
}

plan tests => 1;

$mw->geometry('+10+10');
my $zzzfile = "$FindBin::RealBin/zzzcursor";
my $xcursor = Tk::Xcursor::LoadCursor($mw, $zzzfile);
#$xcursor->Define($mw);
Tk::Xcursor::Define($xcursor, $mw);

MainLoop;

pass("ok");

__END__
