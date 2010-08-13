# -*- cperl -*-

use File::Basename qw(dirname);
use File::Spec     qw();
use Tk::MMutil;

# Find path to existing pTk include files
my $ptkPath = dirname(Tk::MMutil::findINC(File::Spec->catfile(qw(Tk pTk Lang.h))));

Tk::MMutil::TkExtMakefile(
			  VERSION      => '0.01',
			  XS_VERSION   => '0.01',
			  NAME         => 'Tk::Xcursor',
			  OBJECT       => '$(O_FILES)',
			  LIBS         => ['-lXcursor', '-lX11'],
			  INC          => "-I$ptkPath",
			  TYPEMAPS     => ['typemap'],
CCFLAGS => '-g',#XXXX
			 );
