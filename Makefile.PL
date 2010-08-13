# -*- cperl -*-

use Tk::MMutil;

if ($^O eq 'MSWin32') {
    warn "Tk::Xcursor is not supported on non-X11 systems.\n";
    exit 0;
}

# XXX Should check rather if -lXcursor is available at all.

Tk::MMutil::TkExtMakefile(
			  VERSION      => '0.01',
			  XS_VERSION   => '0.01',
			  NAME         => 'Tk::Xcursor',
			  OBJECT       => '$(O_FILES)',
			  LIBS         => ['-lXcursor'],
			  TYPEMAPS     => ['typemap'], # seems to be needed, why?
			 );
